FROM golang:alpine3.20 AS builder

WORKDIR /app

COPY main.go .

ENV GO111MODULE=off
RUN go build -ldflags="-s -w" -o main

FROM scratch

COPY --from=builder /app/main /app/main

CMD ["/app/main"]