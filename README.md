# bootcamp_docker-browser-server
Docker image for docker-browser-server to run as the backend for a bootcamp tutorial. Use this as a base for your own docker-browser-server.

Sample:

```
FROM monsdar/bootcamp-docker-browser-server

CMD docker-browser-server monsdar/bootcamp-baseimage -p 8080
```

You need to expose your docker.sock when running. Make sure you pulled the baseimage that you want to use. Run like this: `docker run -p 8080:8080 -p 8441:8441 -v /var/run/docker.sock:/var/run/docker.sock monsdar/bootcamp-docker-browser-server`

