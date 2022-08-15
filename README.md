[![Project status](https://badgen.net/badge/project%20status/stable%20%26%20actively%20maintaned?color=green)](https://github.com/homecentr/docker-frigate/graphs/commit-activity) [![](https://badgen.net/github/label-issues/homecentr/docker-frigate/bug?label=open%20bugs&color=green)](https://github.com/homecentr/docker-frigate/labels/bug) [![](https://badgen.net/github/release/homecentr/docker-frigate)](https://hub.docker.com/repository/docker/homecentr/frigate)
[![](https://badgen.net/docker/pulls/homecentr/frigate)](https://hub.docker.com/repository/docker/homecentr/frigate) 
[![](https://badgen.net/docker/size/homecentr/frigate)](https://hub.docker.com/repository/docker/homecentr/frigate)

[![CI/CD](https://github.com/homecentr/docker-frigate/actions/workflows/ci_cd.yml/badge.svg)](https://github.com/homecentr/docker-frigate/actions/workflows/ci_cd.yml)


# Homecentr - Frigate

## Exposed ports

| Port | Protocol | Description |
|------|------|-------------|
| 5000 | TCP | HTTP Web UI |
| 1935 | TCP | RTSP | 

## Volumes

| Container path | Description |
|------------|---------------|
| /config | The container expects config file at `/config/config.yml` |

## Security
The container is regularly scanned for vulnerabilities and updated. Further info can be found in the [Security tab](https://github.com/homecentr/docker-frigate/security).

### Container user
The container uses UID:GID of 1000:1000 by default. The image needs to be rebuilt if you need to change the UID/GID.