# imagemagick-docker
Docker build of ImageMagick

Docker container with [ImageMagick](https://imagemagick.org/) installed.

The original purpose of this image was to use ImageMagick's `convert` executable to save PDF to JPG images. It was tested for this purpose to ensure the fonts of the PDF were rendered correctly with Ghostscript (`gs`) which is installed along side ImageMagick.

If you want to read a file from the host system, you can use the `-v` flag of the Docker CLI to bind a volume for input and output. An example usage is below.

### Use pre-built image
Download the image from docker hub:

    $ docker pull elifesciences/imagemagick

### Build the image
Use local `Dockerfile` to build the image on your machine:

    $ docker build -t your_image_name .

### eLife update the image at Docker hub
The `Jenkinsfile` is linked to a build pipeline, and when that pipeline is run, it will push an updated image to Docker hub with the tag `latest`, will be listed at (https://hub.docker.com/r/elifesciences/imagemagick).

### Run the image using the Docker CLI
First, build or download the docker image.

The default entrypoint of the image is to the `convert` program (https://imagemagick.org/script/convert.php).

Example usage of converting a PDF to JPG, if the PDF file is located at `/tmp/cover.pdf`, if the image you are using is named `elifesciences/imagemagick`, the following will produce a fairly crisp, good quality JPG file with a width of 1,200 pixels:

    $ docker run --rm -v "/tmp:/imgs" elifesciences/imagemagick -resize 1200 -density 200 -quality 90 "/imgs/cover.pdf" "/imgs/cover.jpg"

If completed successfully, you should have a JPG file at `/tmp/cover.jpg` on the host machine.

### Other potential use cases
This is only one example of running `convert`. You may be able to convert from any input file to any output file format (although this was not tested yet). If you specify a different `--entrypoint` value to the docker CLI you can probably invoke other ImageMagick programs, which was also not tested.
