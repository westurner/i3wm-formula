{% from "i3wm/map.jinja" import i3wm with context %}

i3:
  pkg.installed:
    - name: {{ i3wm.pkg }}
    #- refresh: True

i3status:
  pkg.installed:
    - name: {{ i3wm.pkg_i3status }}

i3lock:
  pkg.installed:
    - name: {{ i3wm.pkg_i3lock }}
