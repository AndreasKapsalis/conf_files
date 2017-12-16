# conf_files
A set of configuration files

## Dependecies for i3, i3lock and polybar
```
sudo apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libxcb-cursor-dev network-manager-gnome i3 i3status i3blocks i3lock ttf-unifont scrot
```
## Font dependencies not in Debian repos
### Fixed fonts
Copy the following into `/etc/fonts/conf.avail/69-fixed-bitmaps.conf`:
```
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <!-- Enabled Fixed bitmap fonts -->
  <selectfont>
    <acceptfont>
      <pattern>
        <patelt name="family">
          <string>Fixed</string>
        </patelt>
      </pattern>
    </acceptfont>
  </selectfont>
</fontconfig>
```
Then:
```
# ln -s ../conf.avail/69-fixed-bitmaps.conf /etc/fonts/conf.d/
# dpkg-reconfigure fontconfig-config
# dpkg-reconfigure fontconfig
```
### Siji fonts
```
git clone https://github.com/stark/siji && cd siji
sudo ./install.sh -d /etc/fonts/conf.d/
```
