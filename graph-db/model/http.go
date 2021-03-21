package model

import (
	"encoding/json"
	"fmt"
	"github.com/neo4j/neo4j-go-driver/v4/neo4j"
	"io/ioutil"
	"net/http"
)

func HandlePerson(w http.ResponseWriter, r *http.Request) {
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		panic(fmt.Errorf("error reading body %v", err))
	}

	var p Person
	err = json.Unmarshal(body, &p)
	if err != nil {
		panic(fmt.Errorf("error unmarshalling %v", err))
	}

	dbUri := "neo4j://localhost:7687"
	driver, err := neo4j.NewDriver(dbUri, neo4j.BasicAuth("root", "abc", ""))
	if err != nil {
		panic(fmt.Sprintf("error connecting to db %v", err))
	}

	WritePerson(driver)
}

func HandleQuestion(w http.ResponseWriter, r *http.Request) {

	dbUri := "neo4j://localhost:7687"
	driver, err := neo4j.NewDriver(dbUri, neo4j.BasicAuth("root", "abc", ""))
	if err != nil {
		panic(fmt.Sprintf("error connecting to db %v", err))
	}

	if r.Method == http.MethodGet {
		questions := ReadAllQuestions(driver)

		resp, err := json.Marshal(questions)
		if err != nil {
			panic(fmt.Errorf("error marshalling %v", err))
		}
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Content-Type", "application/json")
		w.Write(resp)
	}
}
