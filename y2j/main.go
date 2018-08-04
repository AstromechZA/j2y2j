package main

import (
	"encoding/json"
	"flag"
	"go-yaml/yaml"
	"log"
	"os"
)

func walkReplace(i interface{}) interface{} {
	switch x := i.(type) {
	case map[string]interface{}:
		for k, v := range x {
			x[k] = walkReplace(v)
		}
		return x
	case map[interface{}]interface{}:
		m := make(map[string]interface{})
		for k, v := range x {
			m[k.(string)] = walkReplace(v)
		}
		return m
	case []interface{}:
		for i, v := range x {
			x[i] = walkReplace(v)
		}
		return x
	default:
		return i
	}
}

func main() {
	flag.Parse()
	v := make(map[string]interface{})

	d := yaml.NewDecoder(os.Stdin)
	err := d.Decode(&v)
	if err != nil {
		log.Printf("Error: %s", err)
	}
	v2 := walkReplace(v)
	e := json.NewEncoder(os.Stdout)
	e.SetIndent("", "  ")
	err = e.Encode(v2)
	if err != nil {
		log.Printf("Error: %s", err)
	}
}
