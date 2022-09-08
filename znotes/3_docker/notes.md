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
