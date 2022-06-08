<!-- omit in toc -->
# Purpose of Build

Configuration options that are applied at build time


<br />

<!-- omit in toc -->
# Table of Contents




# Build

  version: "3.9"
  services:
    webapp:
      build:
        context: ./dir
        dockerfile: Dockerfile-alternate
        args:
          buildno: 1

## context
* a path where contains dockerfile
* if relative path, it is interpreted as relative to **the location of the Compose file**

## dockerfile
* Compose uses an alternate dockerfile to build with
* name of dockerfile
* without the field, docker-compose will look for any Dockerfile in the path of context
  
## args
* Add build arguments, which are environment variables accessible only during the build process.

