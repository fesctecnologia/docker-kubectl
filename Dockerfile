FROM docker:latest

ENV KUBE_VERSION v1.16.0
ENV KUBECTL_DOWNLOAD_URL https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl

RUN apk upgrade --update \
    && apk add bash curl wget ca-certificates git \
    && wget ${KUBECTL_DOWNLOAD_URL} -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && rm -rf /var/cache/apk/*

CMD ["/bin/bash"]
