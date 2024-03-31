FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache opam dune ocaml gcc g++ make zlib-dev libev libev-dev

RUN opam init -y --disable-sandboxing

# RUN opam switch create 4.13.1

ENV OPAMYES=1

RUN opam install dune utop dream

WORKDIR /app

RUN dune build

CMD ["dune", "exec", "./main.exe"]