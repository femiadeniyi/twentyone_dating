package main

import (
	"fmt"
	"github.com/neo4j/neo4j-go-driver/v4/neo4j"
	. "graph-db/model"
	"log"
	"net/http"
)

func main() {
	dbUri := "neo4j://localhost:7687"
	driver, err := neo4j.NewDriver(dbUri, neo4j.BasicAuth("root", "abc", ""))
	if err != nil {
		panic(fmt.Sprintf("error connecting to db %v", err))
	}
	// Handle driver lifetime based on your application lifetime requirements  driver's lifetime is usually
	// bound by the applicati
	WriteDefaultQuestions(driver)

	http.HandleFunc("/person", HandlePerson)
	http.HandleFunc("/question", HandleQuestion)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
