FROM alpine:3.17
MAINTAINER Yucel Okcu <yucel.n.okcu@gmail.com>

ARG KUBE_VERSION="v1.28.4"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    apk add --no-cache --update openssl curl ca-certificates aws-cli && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/$KUBE_VERSION/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cluster-info"]
