#!/bin/bash
docker build --tag elifesciences/imagemagick:${IMAGE_TAG:-latest} .
