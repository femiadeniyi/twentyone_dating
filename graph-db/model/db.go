package model

import (
	"encoding/json"
	"fmt"
	"github.com/neo4j/neo4j-go-driver/v4/neo4j"
)

func WritePerson(driver neo4j.Driver) {

}

func WriteDefaultQuestions(driver neo4j.Driver) {
	// Sessions are short-lived, cheap to create and NOT thread safe. Typically create one or more sessions
	// per request in your web application. Make sure to call Close on the session when done.
	// For multi-database support, set sessionConfig.DatabaseName to requested database
	// Session config will default to write mode, if only reads are to be used configure session for
	// read mode.
	session := driver.NewSession(neo4j.SessionConfig{})
	defer session.Close()

	// read all questions
	records, err := session.WriteTransaction(readAllQuestions())
	if err != nil {
		panic(fmt.Errorf("tx error %v", err))
	}

	// decode tx
	questions := records.([]Question)

	// rewrite if corrupt
	if len(questions) != len(Questions()) {
		_, err := session.WriteTransaction(deleteAllQuestions())
		if err != nil {
			panic(fmt.Errorf("tx error %v", err))
		}

		_, err = session.WriteTransaction(writeQuestions(Questions()))
		if err != nil {
			panic(fmt.Errorf("tx error %v", err))
		}
	}
}

func ReadAllQuestions(driver neo4j.Driver) []Question {

	session := driver.NewSession(neo4j.SessionConfig{})
	defer session.Close()

	// read all questions
	records, err := session.WriteTransaction(readAllQuestions())
	if err != nil {
		panic(fmt.Errorf("tx error %v", err))
	}

	// decode tx
	questions := records.([]Question)

	return questions
}

func readAllQuestions() func(tx neo4j.Transaction) (interface{}, error) {

	return func(tx neo4j.Transaction) (i interface{}, e error) {

		var questions []Question

		record, err := tx.Run("MATCH (n:Question)-[]->(r:Response) RETURN n{.name, .text, options:collect(r{.text, .oid})} ", map[string]interface{}{})
		if err != nil {
			panic(fmt.Errorf("could not run query %v", err))
		}

		records, err := record.Collect()
		if err != nil {
			panic(fmt.Errorf("error collecting records %v", err))
		}

		for _, v := range records {
			var question Question

			node := v.Values[0].(map[string]interface{})

			str, err := json.Marshal(node)
			if err != nil {
				panic(fmt.Errorf("error unmarshalling %v", err))
			}
			err = json.Unmarshal(str, &question)
			if err != nil {
				panic(fmt.Errorf("error unmarshalling %v", err))
			}

			fmt.Println(question)

			questions = append(questions, question)
		}

		return questions, e
	}
}

func deleteAllQuestions() func(tx neo4j.Transaction) (interface{}, error) {
	return func(tx neo4j.Transaction) (i interface{}, e error) {

		_, err := tx.Run("match (n)\ndetach delete n", map[string]interface{}{})

		if err != nil {
			panic(fmt.Errorf("could not run query %v", err))
		}

		return i, e
	}
}

func writeQuestions(questions []Question) func(tx neo4j.Transaction) (interface{}, error) {

	return func(tx neo4j.Transaction) (i interface{}, e error) {

		for _, v := range questions {
			queryStr := createQueryStr(v)
			fmt.Println(queryStr)
			_, err := tx.Run(queryStr, map[string]interface{}{})

			if err != nil {
				panic(fmt.Errorf("could not run query %v", err))
			}
		}

		return i, e
	}
}

func createQueryStr(q Question) string {
	cypher := fmt.Sprintf("merge (q:Question { name: \"%v\", text: \"%v\" })", q.Name, q.Text)
	for i, v := range q.Options {
		cypher += fmt.Sprintf("\nmerge (q)-[:IS_ANSWERED_BY]->(r%v:Response { oid: %v, text: \"%v\"  })", i, v.Oid, v.Text)
	}

	return cypher
}
