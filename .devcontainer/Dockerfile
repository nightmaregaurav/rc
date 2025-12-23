FROM alpine:latest

WORKDIR /workspace/

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git curl bash && \
    apk add --no-cache bash && \
    apk fix  # Always on last, add commands before it
RUN /bin/bash -c "$(curl -fsSL https://github.com/nightmaregaurav/rc/raw/refs/heads/main/setup)"
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8
