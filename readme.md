## description

ubuntu squid-openssl image to use `ssl_bump` directive 

## build docker image
```
export SQUID_VERSION=6.6
docker buildx build --platform linux/amd64 --build-arg SQUID_VERSION -t zetanova/squid:6.6 -t zetanova/squid:latest --push .
```

## list versions
`docker run --rm ubuntu:24.04 apt-get update && apt list -a squid-openssl`