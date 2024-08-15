package main

import (
	"log"
	"net/http"
	"os"

	"github.com/joho/godotenv"
)

func logHandlerWrapper(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		next.ServeHTTP(w, r)
		log.Printf("%s %s", r.Method, r.RequestURI)
	})
}

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatalf("Error: %s", err.Error())
	}

	directory := "./static"

	_, err = os.Stat(directory)
	if err != nil {
		log.Fatalf("Error: %s", err.Error())
	}

	fileServer := http.FileServer(http.Dir(directory))
	handler := http.StripPrefix("/", fileServer)
	loggedHandler := logHandlerWrapper(handler)

	// http.Handle("/", http.StripPrefix("/", fileServer))

	log.Println("Serving files from", directory)

	hostName := os.Getenv("HOSTNAME")
	port := os.Getenv("PORT")
	if hostName == "" {
		hostName = "localhost:"
	}
	if port == "" {
		port = "8000"
	}

	log.Println("Starting server at: http://" + hostName + ":" + port)
	log.Fatal(http.ListenAndServe(hostName+":"+port, loggedHandler))
}
