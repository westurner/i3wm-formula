
# http://i3wm.org/docs/repositories.html

i3-ppa:
  pkgrepo.managed:
    - humanname: i3-stable-{{ grains['oscodename'] }}
    - name: deb http://debian.sur5r.net/i3/ {{ grains['oscodename'] }} universe 
    - dist: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/i3-stable-snapshots-{{ grains['oscodename'] }}.list
    #- keyid: 323293EE
    #- keyserver: keyserver.ubuntu.com
    #  http://debian.sur5r.net/sur5r-keyring/dists/testing/main/source/
    - key_url: salt://i3wm/files/sur5r-keyring.gpg
    #- gpgcheck: 1
    #- gpgkey: 
    - require_in:
      - pkg: i3

  pkg.latest:
    - name: i3
    #- refresh: True

