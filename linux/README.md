# BusyBox Config

The container uses a minimal BusyBox build with only the HTTPD feature enabled:

```bash
git clone git://busybox.net/busybox.git
cd busybox
make allnoconfig
make menuconfig
# Select: Network Utilities > httpd
#         Settings > Build static binary
```

More to read: <https://lipanski.com/posts/smallest-docker-image-static-website>
