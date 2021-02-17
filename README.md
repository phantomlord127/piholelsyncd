# piholelsyncd
keep two or more piholes in sync (primary and secondary)

# install

1. install `lsyncd` on your primary pi.
2. copy the ssh key to your secondary pihole. (`ssh-copy-id`)
3. create the lua config file with `sudo nano /etc/lsyncd/lsyncd.conf.lua`
4. edit the bash script, if your secondary pihole is not running in docker
5. create the service file with `sudo nano /etc/systemd/system/lsyncd.service`
6. `systemctl reenable lsyncd.service` on your primary pihole to activate the service
7. `systemctl start lsyncd.service` on your primary pihole to start the service

# source
- https://adminforge.de/linux-allgemein/lsyncd-lokale-dateien-mit-mehreren-servern-synchronisieren/
- https://discourse.pi-hole.net/t/high-availability-ha-for-pi-hole-running-two-pi-holes/3138/46
