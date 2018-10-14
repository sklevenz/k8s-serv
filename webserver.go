package main

import (
	"net/http"
)

func sayHello(w http.ResponseWriter, r *http.Request) {
	message := "Hello World!"

	w.Write([]byte(message))
}

func healthProbe(w http.ResponseWriter, r *http.Request) {
	message := "ok"

	w.Write([]byte(message))
}

func readyProbe(w http.ResponseWriter, r *http.Request) {
	message := "ready"

	w.Write([]byte(message))
}

func main() {
	http.HandleFunc("/health", healthProbe)
	http.HandleFunc("/ready", readyProbe)
	http.HandleFunc("/", sayHello)
	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}