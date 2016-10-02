
# == State: tz
#
# This state configures the system timezone.
#
{% from "tz/map.jinja" import tz with context %}

timezone_setting:
  timezone.system:
    - name: {{ tz.timezone }}
    - utc: {{ tz.utc }}
