# ASDF Docker for Codespaces

This repository contains a Dockerfile for creating a development environment with ASDF tools. The resulting Docker image can be used in Visual Studio Code Codespaces or any other containerized development environment.

## Building

To build the Docker image, use the following command(s) from root:

> NODE EXAMPLE

```bash
docker build -t mthomps4/devcontainer-node:latest -f asdf-node/Dockerfile .
```

This command tags the image with `:latest`. You can replace your-username with your Docker Hub username and use any versioning strategy that suits your project.

## Testing the build

```bash
docker run -it mthomps4/devcontainer-node:latest
```

## Pushing the Docker Image to Docker Hub

Before pushing the image to Docker Hub, make sure to log in using the docker login command:

```bash
docker login
```

Once logged in, push the image to Docker Hub with the following commands:

```bash
docker push mthomps4/devcontainer-node:latest
docker push mthomsp4/devcontainer-node:0.1
```

These commands push the specified tags to the Docker Hub registry. You can choose to push specific versions or use the :latest tag for the most recent version.

Now, your Docker image is available on Docker Hub and can be used in your development environment or shared with others.

## Using the Docker Image in Codespaces

In your Visual Studio Code project, create or update the .devcontainer/devcontainer.json file to reference the Docker image:

```jsonc
{
  "name": "My Dev Container",
  "image": "mthomsp4/devcontainer-node:0.1",
  // ... other configurations ...
}
```

Adjust the image tag according to the version or tag you want to use in your Codespaces environment.

Feel free to customize the Dockerfile to include any additional tools or configurations needed for your development environment.
