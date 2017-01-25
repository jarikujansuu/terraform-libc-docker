# Version of Terraform docker image that has libc so it can be used in AWS CodeBuild

FROM frolvlad/alpine-glibc:alpine-3.5
MAINTAINER "Jari Kujansuu <kujansuujari@gmail.com>"

ENV TERRAFORM_VERSION=0.8.4
ENV TERRAFORM_SHA256SUM=297d35d0b4311445cd87ef032d3dec917bcc7a8b163ead28a4c45d966a2f75cc

RUN apk add --update git curl && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ENTRYPOINT ["/bin/terraform"]