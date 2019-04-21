# Example Static Site Migration to Kubernetes
This repository contains an example static site hosted on a LAMP stack, and subsequent migration to kubernetes.

## Kubernetes Branch
You are on the finished kubernetes branch. To see what the site looked like before, check out the `static` git branch.

## How It Works
First, I'm using a Makefile to easily store the long command-line arguments. It's as simple as calling `make build` when you need to rebuild your image.

Change the `IMAGE_NAME` variable to your desired image name. I'm using the full `gcr.io/project-name/image-name` path so I can easily push these images to my private docker repository in Google Cloud.

Call `make build` from the project root to build and tag a new docker image. Once that's done, confirm it's working by running the `make run` command and visiting your browser at http://0.0.0.0:8000/

With that working, `Ctrl-C` out of the running script, and run `make push` to push your changes to your GCR repository (provided you have it set up already).

Once your changes have been successfully pushed, you can call `make deploy` to deploy your site and service to your kubernetes cluster. Keep in mind, you will stil need to handle ingress traffic.
