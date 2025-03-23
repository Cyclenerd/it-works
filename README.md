# It Works! 🎉

[![Badge: Docker](https://img.shields.io/badge/Docker-%230db7ed.svg?logo=docker&logoColor=white)](#readme)
[![Badge: Linux](https://img.shields.io/badge/Linux-FCC624.svg?logo=linux&logoColor=black)](#readme)
[![Badge: License](https://img.shields.io/github/license/cyclenerd/it-works)](https://github.com/Cyclenerd/it-works/blob/master/LICENSE)

Ultra-lightweight Container image (<170 KB uncompressed) with an elegant celebration webpage featuring animated confetti explosions.

![Screenshot](./img/screenshot.png)

This image is designed for basic container operation verification, demonstrating:

* The host system can run containers.
* Images can be successfully retrieved from the docker.io registry.
* Containers can be created without errors.
* The container can serve HTTP content, confirming network functionality.

**Container image:**

```text
docker.io/cyclenerd/it-works:latest
```

**Multiarch support:**

* `amd64` : Intel or AMD 64-Bit CPU (x86-64)
* `arm64` : Arm-based 64-Bit CPU (i.e. Apple silicon, AWS Graviton, Ampere Altra, Google Axion)

## Quick Start

```bash
# Pull and run the container
docker run -p 8080:8080 "docker.io/cyclenerd/it-works:latest"

# Access in browser
# http://localhost:8080
```

## Building from Source

```bash
# Clone the repository
git clone https://github.com/Cyclenerd/it-works.git
cd it-works

# Build the Container image
docker build --tag "it-works:latest" .

# Run the Container
docker run -p 8080:8080 "it-works:latest"
```

## Acknowledgments

Container optimization based on Florin Lipan's [blog post](https://lipanski.com/posts/smallest-docker-image-static-website) on creating minimal Docker images for static websites.

## License

All files in this repository are under the [Apache License, Version 2.0](LICENSE) unless noted otherwise.

This favicon was generated using the following graphics from [Twitter Twemoji](https://github.com/twitter/twemoji):

- Title: 1f389.svg
- Author: Copyright 2020 Twitter, Inc and other contributors
- Source: <https://github.com/twitter/twemoji/blob/master/assets/svg/1f389.svg>
- License: [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/)
