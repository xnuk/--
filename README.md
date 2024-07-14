# My sweetly sweet `XDG_CONFIG_HOME`
Clone this into `XDG_CONFIG_HOME` (usually `~/.config/`) and chill

## Additional install guide
### hwdb.d
Symlink to `/etc/udev/hwdb.d`:
```sh
rm -d /etc/udev/hwdb.d  # if exists
sudo ln -s "$(realpath ./hwdb.d)" /etc/udev/hwdb.d
```

If you're using different disk partition (or btrfs subvolume) between
`/etc/udev` and `XDG_CONFIG_HOME`, you'll mostly have a trouble to apply
proper hwdb in every reboot. In this case:

1. do a hard copy: `sudo cp ./hwdb.d/* /etc/udev/hwdb.d/`
2. or edit `/etc/fstab` to add
  `x-systemd.automount,x-systemd.before=systemd.hwdb-update.service` option
  in your partition containing this config folder.


Rebooting will apply changes. To instant apply, do:

```sh
sudo systemd-hwdb update --strict  # this one compiles hwdb.bin
sudo udevadm trigger
```

and re-plug the devices

### Desktop icons
```sh
rm -r ~/.local/share/applications
ln -s "$(realpath ./applications)" ~/.local/share/applications
```
