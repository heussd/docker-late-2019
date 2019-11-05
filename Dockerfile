# syntax = docker/dockerfile:experimental
FROM	alpine/git as git1
WORKDIR	/cloned
RUN		git clone https://github.com/oscarmorrison/md-page . && \
		git reset --hard 570b23078ca4eae4925071eac76ba11ef1c54b79

FROM	alpine/git as git2
WORKDIR	/cloned
RUN		git clone https://github.com/heussd/my-way-to-view-things . && \
		git reset --hard  148f76b48eee729773b9432d9e6480bbfbf20cee

FROM ubuntu as build
WORKDIR /build

# Build artifact
RUN 	--mount=type=bind,target=/build/src/ echo '<script src="md-page.js"></script><noscript>' > 'index.html' && \
			echo '<link rel="stylesheet" type="text/css" href="text-reading.css" media="screen" />' >> 'index.html' && \
			echo '' >> 'index.html' && \
			cat "src/Readme.md" >> 'index.html'

# Serve artifact
FROM pierrezemb/gostatic
WORKDIR /srv/http

COPY img ./img/
COPY --from=git1 /cloned/md-page.js ./
COPY --from=git2 /cloned/text-reading.css ./
COPY --from=build /build/index.html .
