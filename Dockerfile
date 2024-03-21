FROM golang:1.22 AS builder

COPY . ./build/tsmetrics/
RUN cd ./build/tsmetrics && go build

FROM golang:1.22
COPY --from=builder /go/build/tsmetrics/tsmetrics /tsmetrics

ENTRYPOINT ["/tsmetrics"]
CMD []
