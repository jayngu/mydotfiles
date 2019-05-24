#!/bin/bash
# https://gist.github.com/dabroder/813a941218bdb164fb4c178d464d5c23

sudo apt update
sudo apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev i3status i3lock

cd /tmp

# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

# restart gdm (systemctl restart) or reboot machine

# Install programs
sudo apt-get install -y feh dmenu arandr compton ranger caca-utils udiskie

# Install dependencies for polybar
sudo apt-get install -y mpd cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev

cd /tmp

# clone the repository for polybar and build from source
git clone https://github.com/polybar/polybar.git
cd polybar
# run ./build.sh and follow instructions

# After configuring polybar, run
# $polybar example
# Make sure it works and edit the config file for errors: ~/.config/polybar/config 

