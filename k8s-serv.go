package main

import (
	"log"
	"net/http"
)

var (
	version string = "dev"
	commit  string = "none"
	date    string = "unknown"
)

func sayHelloHandler(w http.ResponseWriter, r *http.Request) {
	message := "Hello World!"

	w.Header().Set("Content-Type", "text/plain")
	w.Write([]byte(message))
}

func healthProbeHandler(w http.ResponseWriter, r *http.Request) {
	message := "ok"

	w.Header().Set("Content-Type", "text/plain")
	w.Write([]byte(message))
}

func readyProbeHandler(w http.ResponseWriter, r *http.Request) {
	message := "ready"

	w.Header().Set("Content-Type", "text/plain")
	w.Write([]byte(message))
}

func versionHandler(w http.ResponseWriter, r *http.Request) {

	w.Header().Set("Content-Type", "text/plain")
	w.Write([]byte(version + " " + commit + " " + date))
}

func main() {
	log.Printf("%v, commit %v, built at %v", version, commit, date)

	http.HandleFunc("/version", versionHandler)
	http.HandleFunc("/health", healthProbeHandler)
	http.HandleFunc("/ready", readyProbeHandler)
	http.HandleFunc("/", sayHelloHandler)
	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}