# conf_files
A set of configuration files

## Dependecies for i3, i3lock and polybar
```
sudo apt install cmake zsh cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libxcb-cursor-dev network-manager-gnome i3 i3status i3blocks i3lock ttf-unifont scrot sxiv ranger feh clipit git libpango1.0-dev ttf-mscorefonts-installer xbacklight xserver-xorg-input-synaptics firefox-esr libpulse-dev libxcbcomposite0-dev
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
# ln -s /etc/fonts/conf.avail/69-fixed-bitmaps.conf /etc/fonts/conf.d/
# dpkg-reconfigure fontconfig-config
# dpkg-reconfigure fontconfig
```
### Siji fonts
```
git clone https://github.com/stark/siji && cd siji
sudo ./install.sh -d /usr/share/fonts/
```
In case Siji font family is not recognized remove the `no-bitmaps.conf` from `/etc/fonts/conf.d`
```
sudo mv /etc/fonts/conf.d/70-no-bitmaps.conf /etc/fonts/conf.d/70-no-bitmaps.conf.bak
```
## xbacklight intel driver integration
Paste the following into `/etc/X11/xorg.conf`:
```
Section "Device"
    Identifier  "Card0"
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
EndSection
```
## Intel graphics driver for Thinkpad x250
Paste the following into `/etc/X11/xorg.conf.d/20-intel.conf`
```
Section "Device"
        Identifier      "Intel Graphics"
        Driver          "intel"
EndSection
```
## Synaptics for Thinkpad x250
Paste the following into `/etc/X11/xorg.conf.d/50-synaptics.conf`
```
Section "InputClass"
        Identifier "touchpad catchall"
        Driver "synaptics"
        MatchIsTouchpad "on"
        Option "TapButton1" "1"
        Option "TapButton2" "3"
EndSection
```
## Sound for Thinkpad x250
In case sound is not working out of the box this probably due to the fact that the HDMI card is loaded first. Change the order by pasting the following into `/etc/modprobe.d/sound.conf`
```
options snd_hda_intel index=1 model=thinkpad
```
