# Configs

Config repository that I use to keep track of all my local configs.

## Ubuntu

### WSL

- For WSL2, the /mnt folder has a very limited speed for I/O Operations. One place where this is noticeable is when using the updatedb command. In order to ignore the /mnt/ folder while calling `sudo updatedb`, the /mnt path can be added to the `PRUNE_PATHS` in the file `/etc/updatedb.conf`
