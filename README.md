# Terraform docker image

This is copy of [official docker image for Terraform](https://hub.docker.com/r/hashicorp/terraform/) but it replaces used Alpine Linux with
[version of Alpine that includes libc](https://hub.docker.com/r/frolvlad/alpine-glibc/) that is required by AWS CodeBuild.
