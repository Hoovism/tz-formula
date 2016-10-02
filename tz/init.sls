
# == State: tz
#
# This state configures the system timezone.
#
{% from "tz/map.jinja" import tz with context %}

timezone_setting:
  timezone.system:
    - name: {{ tz.timezone }}
    - utc: {{ tz.utc }}

timezone_packages:
  pkg.installed:
    - name: {{ tz.package }}

timezone_symlink:
  file.symlink:
    - name: {{ tz.path_localtime }}
    - target:  {{ tz.path_zoneinfo }}{{ tz.timezone }}
    - force: True
    - require:
      - pkg: {{ tz.package }}

