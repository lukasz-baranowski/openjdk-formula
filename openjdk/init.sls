{%- from "openjdk/settings.sls" import openjdk with context %}

openjdk_install:
  pkg:
    - installed
    - name: {{ openjdk.package_name }}

{% if grains['os_family'] != 'RedHat' %}
openjdk_update_alternatives:
  alternatives.set:
    - name: java
    - path: {{ openjdk.java_path }}
{% endif %}

openjdk_set_java_home:
  file.managed:
    - name: /etc/profile.d/java_home.sh
    - source: salt://openjdk/files/java_home.sh
    - mode: 644
    - user: root
    - group: root
