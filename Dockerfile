FROM golang:1.18 as builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server

FROM scratch as production
COPY --from=builder /app/server /server
ENTRYPOINT [ "/server" ]