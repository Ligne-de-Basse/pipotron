FROM            golang:1.12-alpine as build
WORKDIR         /go/src/moul.io/pipotron
RUN             apk add --no-cache git gcc musl-dev make
RUN             go get -u github.com/gobuffalo/packr/v2/packr2
COPY            go.* ./
RUN             GO111MODULE=on go mod download
COPY            dict ./dict
RUN             packr
COPY            . .
RUN             make install

FROM            alpine
COPY            --from=build /go/bin/pipotron /bin/
ENTRYPOINT      ["/bin/pipotron"]
