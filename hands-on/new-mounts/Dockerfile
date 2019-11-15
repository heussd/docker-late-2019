# syntax=docker/dockerfile:experimental

FROM ubuntu
WORKDIR /
RUN --mount=type=bind,target=/mystuff cat /mystuff/hello

CMD cat /mystuff/hello