FROM ubuntu

# Install requirements
RUN   apt-get update && apt-get install -y git lighttpd

WORKDIR /var/www/html/

# Pull dependencies
RUN     git clone https://github.com/oscarmorrison/md-page
RUN		git clone https://github.com/heussd/my-way-to-view-things

# Copy sources
COPY	img ./img/
COPY    Readme.md ./

# Build artifact
RUN 	echo '<script src="md-page/md-page.js"></script><noscript>' > 'index.html' && \
			echo '<link rel="stylesheet" type="text/css" href="my-way-to-view-things/text-reading.css" media="screen" />' >> 'index.html' && \
			echo '' >> 'index.html' && \
			cat "Readme.md" >> 'index.html'

# Serve artifact
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]