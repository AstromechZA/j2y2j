package main

import (
	"encoding/json"
	"flag"
	"go-yaml/yaml"
	"log"
	"os"
)

func main() {
	flag.Parse()
	v := make(map[string]interface{})

	d := json.NewDecoder(os.Stdin)
	err := d.Decode(&v)
	if err != nil {
		log.Printf("Error: %s", err)
	}

	e := yaml.NewEncoder(os.Stdout)
	err = e.Encode(v)
	if err != nil {
		log.Printf("Error: %s", err)
	}
}
