# Use an official Go image for building the application
FROM golang:1.20

# Set the working directory
WORKDIR /app

# Copy the Go program and payloads file into the container
COPY main.go payloads.txt ./

# Build the Go program
RUN go build -o reflected-xss main.go

# Use ENTRYPOINT to handle arguments properly
ENTRYPOINT ["./reflected-xss"]
