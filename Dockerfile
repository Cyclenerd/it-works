# Copyright 2025-2026 Nils Knieling
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM docker.io/library/alpine:latest AS builder

ENV BUSYBOX_VERSION="1.37.0"

# Install all dependencies required for compiling busybox and minifying the website
RUN apk add gcc musl-dev make perl npm

# Download busybox sources
RUN wget "https://busybox.net/downloads/busybox-${BUSYBOX_VERSION}.tar.bz2" \
  && tar xf "busybox-${BUSYBOX_VERSION}.tar.bz2" \
  && mv "/busybox-${BUSYBOX_VERSION}" "/busybox"

WORKDIR /busybox

# Copy the busybox build config (limited to httpd)
COPY /linux/.config .

# Compile
RUN make && \
	./make_single_applets.sh

# Minify the website (HTML + inline CSS/JS)
COPY /www/index.html /www-src/index.html
RUN mkdir -p /www-min && npx --yes html-minifier-terser \
	--collapse-whitespace --remove-comments \
	--minify-css true --minify-js true \
	--remove-attribute-quotes --collapse-boolean-attributes \
	-o /www-min/index.html /www-src/index.html

# Switch to the scratch image
FROM scratch

EXPOSE 8080

# Copy the busybox static binary
COPY --from=builder /busybox/busybox_HTTPD /bin/httpd

COPY --from=builder /www-min/index.html /var/www/index.html
COPY /www/favicon.ico /var/www/favicon.ico
CMD ["/bin/httpd", "-f", "-v", "-p", "8080", "-h", "/var/www"]
