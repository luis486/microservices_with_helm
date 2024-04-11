FROM golang:1.22

WORKDIR /usr/src/app
COPY . .
# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
ENV GO111MODULE=on
RUN go mod init github.com/bortizf/microservice-app-example/tree/master/auth-api
RUN go mod tidy
RUN go build
# Expose port 8000 to the outside world
EXPOSE 8000

# Set environment variables
CMD ["./auth-api"]