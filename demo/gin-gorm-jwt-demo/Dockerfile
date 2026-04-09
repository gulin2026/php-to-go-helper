FROM golang:1.23 AS builder
WORKDIR /app
COPY . .
RUN go mod tidy && go build -o app ./cmd/api

FROM debian:stable-slim
WORKDIR /app
COPY --from=builder /app/app ./app
EXPOSE 8080
CMD ["./app"]
