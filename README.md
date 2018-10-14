# k8s-serv

A simple server in go to play with k8s, helm ...

- implement web server (hello go)
- add travis ci
- add version support
- add goreleaser support



# build instructions


build with:
´´´
go build ./...
´´´

build with version info:
´´´
go build -ldflags "-X main.version=0.0.0 -X main.commit=`git rev-parse HEAD` -X main.buildstamp=`date -u +%Y%m%d.%H%M%S`" k8s-serv.go
´´´

test with:
´´´go test ./...
´´´

# run server

´´´
go run k8s-serv.go
curl -sS http://localhost:8080/version
´´´

# release instructions

