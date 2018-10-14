package main

import (
	"net/http"
)

type versionStruct struct {
	version string
	commit string
	buildstamp string
}

var versionInfo = versionStruct{"undefined","undefined", "undefined"}

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
	w.Write([]byte(versionInfo.version + ", " +versionInfo.commit + ", " + versionInfo.buildstamp))
}

func main() {
	http.HandleFunc("/version", versionHandler)
	http.HandleFunc("/health", healthProbeHandler)
	http.HandleFunc("/ready", readyProbeHandler)
	http.HandleFunc("/", sayHelloHandler)
	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}