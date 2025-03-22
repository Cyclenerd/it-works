# It Works! 🎉

Ultra-lightweight Docker Container (under 170 KB) with an elegant celebration webpage featuring animated confetti explosions.

![Screenshot](./img/screenshot.png)

Container image:

```text
docker.io/cyclenerd/it-works:latest
```

Supported architectures:

- Linux x86-64:  `linux/amd64`
- ARMv8 64-bit:  `linux/arm64/v8`
- ARMv7 32-bit:  `linux/arm/v7`
- ARMv6 32-bit:  `linux/arm/v6`
- IBM POWER8:    `linux/ppc64le`
- RISC-V 64-bit: `linux/riscv64`
- IBM z Systems: `linux/s390x`

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
