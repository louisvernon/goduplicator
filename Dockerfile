FROM golang:1.10.1 as build
RUN go get golang.org/x/sys/unix
COPY / /build/
WORKDIR /build/
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest
WORKDIR /root/
COPY --from=build /build/app .
CMD ["./app"] 
