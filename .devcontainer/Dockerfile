FROM alpine:latest

WORKDIR /workspace/

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git curl && \
    apk add --no-cache bash && \
    apk fix  # Always on last, add commands before it

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8
