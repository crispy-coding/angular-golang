package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"
)

func main() {
	disableCORS := len(os.Args) <= 1 || os.Args[1] != "prod"
	fmt.Println(disableCORS)

	http.HandleFunc("/api", func(w http.ResponseWriter, r *http.Request) {
		if disableCORS {
			w.Header().Set("Access-Control-Allow-Origin", "*")
			w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
			w.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")
		}
		json.NewEncoder(w).Encode("Hello from Golang Backend!")
	})

	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		fmt.Println("error:", err)
	}
}
