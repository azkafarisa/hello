FROM golang:1.17-alpine as builder
WORKDIR /app/main.go
ADD . /app
RUN cd /app && go build -o hello

FROM alpine
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
WORKDIR /app
COPY --from=build-env /app/hello /app
EXPOSE 4444
ENTRYPOINT ./hello

