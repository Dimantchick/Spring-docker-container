LABEL maintainer="Dmitrii Reshetinskii"
LABEL release-date="2025-01-25"
LABEL description="Base docker image for Spring boot containers. \
Based on bellsoft/liberica-openjdk-alpine-musl image. \
Running container with javauser (non root)."

ARG JAVA_VERSION

FROM bellsoft/liberica-openjdk-alpine-musl:${JAVA_VERSION}

RUN apk add --update --no-cache curl jq && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apk/* && \
    rm -f /sbin/apk && \
    rm -rf /etc/apk && \
    rm -rf /lib/apk && \
    rm -rf /usr/share/apk && \
    rm -rf /var/lib/apk

# Application user
RUN addgroup -S java && adduser -S javauser -G java \
    && mkdir /workspace && chown -R javauser:java /workspace

WORKDIR /workspace

# Run as root - bad practice
USER javauser

# Spring Boot Launcher
ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]
