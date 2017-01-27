{% set java_version = salt['pillar.get']('openjdk:version', 8)|string() %}

{% set vars = {
    'RedHat': {
      'package_name': 'java-1.' + java_version + '.0-openjdk',
      'folder_name': 'java-1.' + java_version + '.0-openjdk.x86_64'
    },
    'Debian': {
      'package_name': 'openjdk-' + java_version + '-jdk',
      'folder_name': 'java-' + java_version + '-openjdk-amd64'
    }
}.get(grains.os_family) %}

{% set package_name = salt['pillar.get']('openjdk:package', vars.package_name) %}

{% set java_path = salt['pillar.get']('openjdk:java_path', '/usr/lib/jvm/' + vars.folder_name + '/jre/bin/java') %}

{% set openjdk = {} %}

{% do openjdk.update({ 'package_name'     : package_name,
                        'java_path'        : java_path,
                        'java_version'     : java_version,
                      })
%}
