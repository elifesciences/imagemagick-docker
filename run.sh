#!/bin/bash
set -e

#
docker run \
    --rm \
    --name imagemagick \
    elifesciences/imagemagick:${IMAGE_TAG:-latest} \
    -version
