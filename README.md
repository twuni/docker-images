# Docker Images

Docker images live here.

## Directory Structure

 * /:organization
   * /:repository
     * /:version
       * /Dockerfile

## Building

Building is quite simple, really. Let's assume you want to build the **twuni/javascript** image, version **1.0.0**:

```sh
$ docker build -t twuni/javascript:1.0.0 twuni/javascript/1.0.0
```
