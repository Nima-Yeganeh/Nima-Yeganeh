# Use ubuntu as the base image
FROM ubuntu
# Add author's name
LABEL maintainer="Nima Yeganeh"
# Add the command to run at the start of container
CMD date
