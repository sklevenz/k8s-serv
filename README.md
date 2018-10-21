# k8s-serv

A simple server in go to play with k8s, helm ...

- implement web server (hello go)
- add travis ci
- add version support
- add goreleaser support
- add docker support

# build instructions


build with:
```
go build ./...
```
build with version info:
```
go build -ldflags "-X main.version=0.0.0 -X main.commit=`git rev-parse HEAD` -X main.buildstamp=`date -u +%Y%m%d.%H%M%S`" k8s-serv.go
```

test with:
```
go test ./...
```

# run server

```
go run k8s-serv.go
curl -sS http://localhost:8080/version
```

# release instructions

build release
```
export GITHUB_TOKEN=`YOUR_TOKEN`

./make-release.sh 0.1.0

```
try out release

```
brew update ; brew install sklevenz/skl/k8s-serv
brew update ; brew upgrade

k8s-serv
curl -sS http://localhost:8080/version
```

# docker support

build docker image

```
./make-docker-image.sh 0.1.0
```

run docker image

```
docker run -p 8080:8080 sklevenz/k8s-serv
curl -sS http://localhost:8080/version
```
