mmate@gebics:~$ snap list
Name               Version          Rev    Tracking         Publisher   Notes
bare               1.0              5      latest/stable    canonical✓  base
core22             20240408         1380   latest/stable    canonical✓  base
firefox            128.0.2-1        4630   latest/stable/…  mozilla✓    -
gnome-42-2204      0+git.ff35a85    141    latest/stable/…  canonical✓  -
gtk-common-themes  0.1-81-g442e511  1535   latest/stable/…  canonical✓  -
snapd              2.63             21759  latest/stable    canonical✓  snapd

mmate@gebics:~$ sudo systemctl disable snapd.service 
[sudo] password for mmate: 
Removed /etc/systemd/system/multi-user.target.wants/snapd.service.
mmate@gebics:~$ sudo systemctl disable snapd.socket 
Removed /etc/systemd/system/sockets.target.wants/snapd.socket.
mmate@gebics:~$ sudo systemctl disable snapd.seeded.service 
Removed /etc/systemd/system/cloud-final.service.wants/snapd.seeded.service.
Removed /etc/systemd/system/multi-user.target.wants/snapd.seeded.service.

mmate@gebics:~$ sudo snap remove firefox 

mmate@gebics:~$ sudo nano /etc/apt/preferences.d/firefox-no-snap
mmate@gebics:~$ sudo add-apt-repository ppa:mozillateam/ppa

mmate@gebics:~$ sudo apt-get install firefox

mmate@gebics:~$ sudo snap remove gtk-common-themes 


mmate@gebics:~$ sudo snap remove gnome-42-2204 

mmate@gebics:~$ sudo snap remove bare 

mmate@gebics:~$ sudo snap remove core22 

mmate@gebics:~$ sudo snap remove snapd 

mmate@gebics:~$ sudo apt-get autoremove --purge snapd

mmate@gebics:~$ rm -r snap/

