# Spring base docker images
## Example usage
See Dockerfile-gradle-build-example to build gradle project, extract jar and create image

Use build command with specified: tag, build-arg JAVA_VERSION and build-arg JAR_PATH (path from repository root to your jar after build)

For example:

`docker build . --tag ghcr.io/dimantchick/github-actions-test:latest --build-arg JAVA_VERSION=21 --build-arg JAR_PATH='build/libs/github-actions-test-0.0.1-SNAPSHOT.jar'` 