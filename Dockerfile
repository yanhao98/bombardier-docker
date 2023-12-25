# docker run -it --rm golang:latest bash
# go install github.com/codesenberg/bombardier@latest
# bombardier -n 1000 -c 50 http://129.154.225.249:20001/
# /go/bin/bombardier

FROM golang:latest as builder
RUN go install github.com/codesenberg/bombardier@latest

FROM debian:stable-slim
COPY --from=builder /go/bin/bombardier /usr/local/bin/bombardier
ENTRYPOINT ["/usr/local/bin/bombardier"]
CMD ["--help"]