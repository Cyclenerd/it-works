# Copyright 2025 Nils Knieling
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

FROM alpine:latest AS builder

ENV BUSYBOX_VERSION="1.37.0"

# Install all dependencies required for compiling busybox
RUN apk add gcc musl-dev make perl

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

# Switch to the scratch image
FROM scratch

EXPOSE 8080

# Copy the busybox static binary
COPY --from=builder /busybox/busybox_HTTPD /bin/httpd

COPY /www/index.html /www/favicon.ico /var/www/
CMD ["/bin/httpd", "-f", "-v", "-p", "8080", "-h", "/var/www"]
