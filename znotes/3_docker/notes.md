Docker for DevOps and Developrs

Pre-Virtualization Problems:
• Huge Cost
• Slow Deployment
• Hard to Migrate

Hypervisor-based Virtualization:
Benefits:
• Cost-Efficient
• Easy to Scale

Limitations:
• Kernel Resource Duplication
• Application Portability Issue

Container Virtualization
Benefits:
• Cost-Efficient
• Fast Deployment
• Guaranteed Portability

Images
• Images are read only templates used to create containers.
• Images are created with the docker build command, either by us or by other docker users.
• Images are composed of layers of other images.
• Images are stored in a Docker registry.

Containers
• If an image is a class, then a container is an instance of a class - a runtime object.
• Containers are lightweight and portable encapsulations of an environment in which to run applications.
• Containers are created from images. Inside a container, it has all the binaries and dependencies needed to run the application.

Registries and Repositories
• A registry is where we store our images.
• You can host your own registry, or you can use Docker’s public registry which is called DockerHub.
• Inside a registry, images are stored in repositories.
• Docker repository is a collection of different docker images with the same name, that have different tags, each tag usually represents a different version of the image.

Why Using Official Images
• Clear Documentation
• Dedicated Team for Reviewing Image Content
• Security Update in a Timely Manner

Dockerfile and Instruc=ons
• A Dockerfile is a text document that contains all the instructions users provide to assemble an image.
• Each instruction will create a new image layer to the image.
• Instructions specify what to do when building the image.

Docker Build Context
• Docker build command takes the path to the build context as an argument.
• When build starts, docker client would pack all the files in the build context into a tarball then transfer the tarball file to the daemon.
• By default, docker would search for the Dockerfile in the build context path.

Chain RUN Instruction
• Each RUN command will execute the command on the top writable layer of the container, then commit the container as a new image.
• The new image is used for the next step in the Dockerfile. So each RUN instruction will create a new image layer.
• It is recommended to chain the RUN instruction in the Dockerfile to reduce the number of image layers it creates.

Sort Multiline Arguments Alphanumerically
• This will help you avoid duplication of packages and make the list much easier to update.

CMD Instructions
• CMD instruction specifies what command you want to run when the container starts up.
• If we don't specify CMD instruction in the Dockerfile, Docker will use the default command defined in the base image.
• The CMD instruc=on doesn’t run when building the image, it only runs when the container starts up.
• You can specify the command in either exec form which is preferred or in shell form.

Docker Cache
• Each =me Docker executes an instruc=on it builds a new image layer.
• The next =me, if the instruc=on doesn't change, Docker will simply reuse
the exis=ng layer.

Benefits of Docker Container Links
• The main use for docker container links is when we build an application with a microservice architecture, we are able to run many independent components in different containers.
• Docker creates a secure tunnel between the containers that doesn’t need to expose any ports externally on the container.

Why Docker Compose?
Manual linking containers and configuring services become impractical when the number of containers grows.

Docker Compose
• Docker compose is a very handy tool to quickly get docker environment up and running.
• Docker compose uses yaml files to store the configuration of all the containers, which removes the burden to maintain our scripts for docker orchestration.

Docker Compose Commands
• docker compose up starts up all the containers.
• docker compose ps checks the status of the containers managed by docker compose.
• docker compose logs outputs colored and aggregated logs for the compose-managed containers.
• docker compose logs with dash f op,on outputs appended log when the log grows.
• docker compose logs with the container name in the end outputs the logs of a specific container.
• docker compose stop stops all the running containers without removing them.
• docker compose rm removes all the containers.
• docker compose build rebuilds all the images.

Unit Tests in Containers
• Unit tests should test some basic functionality of our docker app code, with no reliance on external services.
• Unit tests should run as quickly as possible so that developers can iterate much faster without being blocked by waiting for the tests results.
• Docker containers can spin up in seconds and can create a clean and isolated environment which is great tool to run unit tests with.

Incorpora=ng Unit Tests into Docker Images
Pros:
• A single image is used through development, testing and production, which greatly ensures the reliability of our tests.
Cons:
• It increases the size of the image.

What is Con=nuous Integra=on?
• Continuous integration is a software engineering practice in which isolated changes are immediately tested and reported when they are added to a larger code base.
• The goal of Continuous integration is to provide rapid feedback so that if a defect is introduced into the code base, it can be identified and corrected as soon as possible.

Set up SSH keys for Github Account
• SSH keys are a way to identify trusted computers without involving password.
• Generate a SSH key pair and save the private SSH key in your local box and add the public key to your GitHub account.
• Then you can directly push your changes to github repository without typing password.

How to check if SSH public key files are available on your local box?
The SSH public key file usually sits under ~/.ssh/ directory and ends with .pub extension.

Link Circle CI with GitHub Account
to build a Continuous Integration pipeline

Opinions about Running Docker in Produc,on
• One one hand, many docker pioneers are confident that a distributed web app can be deployed at scale using Docker and have incorporated Docker into their production environment.
• On the other hand, there are still some people who are reluctant to use Docker in production as they think docker workflow is too complex or unstable for real life use cases.

Concerns about Running Docker in Produc,on
• There are still some missing pieces about Docker around data persistence, networking, security and identity management.
• The ecosystem of supporting Dockerized applications in production such as tools for monitoring and logging are still
not fully ready yet.

Why Running Docker Containers inside VMs?
• To address security concerns.
• Hardware level isola=on.

