package main

import "encoding/json"

type Dict map[string][]string

// FIXME: an option should be a string or a string with a weight

func (d Dict) String() string {
	out, _ := json.MarshalIndent(d, "", "  ")
	return string(out)
}