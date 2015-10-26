include:
  - i3wm

# http://i3wm.org/docs/repositories.html

{% set keyring_deb_name="sur5r-keyring_2015.02.08_all.deb" -%}
{% set keyring_deb_url="http://debian.sur5r.net/sur5r-keyring/pool/main/s/sur5r-keyring/"+keyring_deb_name -%}

/etc/apt/{{ keyring_deb_name }}:
  file.managed:
#    - name: i3-sur5r-keyring-{{ keyring_deb_name }}
    - source: {{ keyring_deb_url }}
    - source_hash: sha512=eb3b15ef692bac8a94c0de2bcc493f84c234c790c03163594f375054f1d4aaf147dde0e5f81be74d3150dbb91d9b2b5c165d1fc07508eaf22c868f3cc9da3032

i3-sur5r-keyring-{{ keyring_deb_name }}-install:
  pkg.installed:
    - sources:
      - sur5r-keyring: {{ keyring_deb_url }}
    - watch:
      - file: /etc/apt/{{ keyring_deb_name }}
    - require_in:
      - pkg: i3
      - pkgrepo: i3-ppa

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
