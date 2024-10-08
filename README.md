Maybe I'm dumb but I wanted to go to prod with docker compose.

I could've just slapped in into an EC2 or whatever, but I also wanted horizontal autoscaling and scale-to-zero.

All the magic platforms like that (ecs fargate, cloud run, railway) only accept docker containers.

Um, okay, but I want to go to prod with docker compose.

Okay, let's put docker compose inside docker.

Errr, docker-in-docker (dind) is a thing but shares the host's original docker socket which is like a whole security thing, i.e., it does work but only if you can run containers with --privileged, which none of the above magic platforms allow.

Okay, well, fly.io runs OCI/docker containers but *without docker*, instead running the images as VMs inside firecracker, a VM hypervisor.

There we go. This repo is a proof of concept of running docker compose up on fly.io.

To run:

```
flyctl launch
flyctl deploy
```

And then you'll get a "Visit your newly deployed app at ____" message.
