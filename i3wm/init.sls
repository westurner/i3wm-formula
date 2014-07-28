{% from "i3wm/map.jinja" import i3wm with context %}

i3:
  pkg.installed:
    - name: {{ i3wm.pkg }}
    #- refresh: True
