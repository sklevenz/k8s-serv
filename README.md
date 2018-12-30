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

./make--go-build-release.sh 0.1.0

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
./make-docker-image-snapshot.sh 0.1.0-snapshot
./make-docker-image-production.sh 0.1.0
```

run docker image

```
docker run -p 8080:8080 sklevenz/k8s-serv:snapshot
docker run -p 8080:8080 sklevenz/k8s-serv:latest
curl -sS http://localhost:8080/version
```

# k8s support

## deploy dashboard

````
./script/dashboard-apply.sh
./script/dashboard-delete.sh
````


## snapshots

````
git checkout -b 0.x.0-snapshot
./script/make-docker-image-snapshot.sh 0.x.0-snapshot

./script/set-namespace-snapshot.sh
./script/k8s-serv-apply-snapshot.sh

curl -sS http://localhost:8081/version

./script/k8s-serv-delete-namespace-snapshot.sh
````

## production

````
git checkout master
./script/make-docker-image-snapshot.sh 0.x.0

./script/set-namespace-production.sh
./script/k8s-serv-apply-production.sh

curl -sS http://localhost:8080/version

./script/k8s-serv-delete-namespace-production.sh
````
