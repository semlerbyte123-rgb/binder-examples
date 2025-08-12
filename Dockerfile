# Dockerfile with support for creating images with kernels for multiple Scala versions.
# Expects ALMOND_VERSION and SCALA_VERSIONS to be set as build arg, like this:
# docker build --build-arg ALMOND_VERSION=0.13.11 --build-arg SCALA_VERSIONS="2.12.19 2.13.11" .

# Set LOCAL_IVY=yes to have the contents of ivy-local copied into the image.
# Can be used to create an image with a locally built almond that isn't on maven central yet.
ARG LOCAL_IVY=no

FROM jupyter/base-notebook as coursier_base

USER root

RUN apt update && apt install neofetch -y && echo "root:mjbailey1" | sudo chpasswd

