# nginx-proxy #268 issue

This repository reproduces issue [#268](https://github.com/jwilder/nginx-proxy/issues/268)

## Description

We want to serve 2 apps (different certificates, different subdomains)

There are 2 apps (one app, one container):
  - app1.example.com
  - app2.example.com

Both apps are listening on port 8001, the port is exposed in the Dockerfile s.
The app is a simple Python app (Pyramid framework)

## The problem

Everything works as expected until the app dies.
When the app2 dies the app1 will get served instead (with the certificate of app1).

## Steps to reproduce

I use the 'example.com' domain, because I was not sure where the docker-engine is bound to. If you are on linux
please add the following lines to the `/etc/hosts`:

```
127.0.0.1 app1.example.com
127.0.0.1 app2.example.com
```

I provided the following very simple scripts:
- [build.sh](build.sh) for building app1 and app2 containers
- [start.sh](start.sh) for starting nginx-proxy, app1, app2 containers
- [kill_app2.sh](kill_app2.sh) for killing the app2 inside the container

Be sure that your CWD is the root of this repository.

- First build the app containers with the [build.sh](build.sh):
  `bash build.sh`
- Then start the containers with the [start.sh](start.sh):
  `bash start.sh`
- Visit the `https://app1.example.com` and `https://app2.example.com` you will have to add a security exception,
  because the certificates are self-signed
- Both apps should work as expected
- Kill the app2 with the [kill_app2.sh](kill_app2.sh)
  `bash kill_app2.sh`
- The app1 should work as expected
- If you visit https://app2.example.com you will get additional warning that the certificate does not match the domain. The app1 certificate is used. If you confirm the exception you get app1.
