# My sweetly sweet `XDG_CONFIG_HOME`
Clone this into `XDG_CONFIG_HOME` (usually `~/.config/`) and chill

## Additional install guide
### hwdb.d
```sh
# Symlinking method could be somehow untrustable.
# If you have a trouble, do a hard copy to /etc/udev/hwdb.d .
sudo ln -s "$(realpath ./hwdb.d)" /etc/udev/hwdb.d

sudo systemd-hwdb update --strict  # this one compiles hwdb.bin
sudo udevadm trigger
```

And re-plug the devices

### Desktop icons
```sh
rm -r ~/.local/share/applications
ln -s "$(realpath ./applications)" ~/.local/share/applications
```
