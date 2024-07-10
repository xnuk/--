# My sweetly sweet `XDG_CONFIG_HOME`
Clone this into `XDG_CONFIG_HOME` (usually `~/.config/`) and chill

## Additional install guide
### hwdb.d
```sh
sudo ln -s "$(realpath ./hwdb.d)" hwdb.d
sudo systemd-hwdb update
```

And re-plug the devices

### Desktop icons
```sh
rm -r ~/.local/share/applications
ln -s "$(realpath ./applications)" ~/.local/share/applications
```
