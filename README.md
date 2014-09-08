## Docker Base: Syslog-ng


This repository contains **Dockerbase** of [Syslog-ng](http://www.syslog-ng.org/) for [Docker](https://www.docker.com/)'s [Dockerbase build](https://registry.hub.docker.com/u/dockerbase/syslog-ng/) published on the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Depends on:

* [dockerbase/ubuntu](https://registry.hub.docker.com/u/dockerbase/ubuntu/)


### Installation

1. Install [Docker](https://docs.docker.com/installation/).

2. Download [Dockerbase build](https://registry.hub.docker.com/u/dockerbase/syslog-ng/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull dockerbase/syslog-ng`


### Usage

    $ docker run -it --rm dockerbase/syslog-ng
    # service syslog-ng start
