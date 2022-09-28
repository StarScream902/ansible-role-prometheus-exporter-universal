Prometheus exporter setup role
=========

!!! This role can work with exporters which have been written in similar way as [classicals](https://prometheus.io/docs/instrumenting/exporters/)
This role installs and configures Prometheus exporters as a systemd service

Role Variables
--------------

```yaml
prometheus_exporter_install_dir: "/opt/prometheus_exporters" # directory where exporters will be hosted

prometheus_exporter_list:
- name: elasticsearch # exporter name
  download_url: https://github.com/prometheus-community/elasticsearch_exporter/releases/download/v1.3.0/elasticsearch_exporter-1.3.0.linux-amd64.tar.gz # exporter release, was given from github releses for example
  exec_params: | # exec parameters for running an exporter
    --es.uri=http://elastic:password@elasticsearch:9200 \
    --web.listen-address=0.0.0.0:8080
- name: logstash
  download_url: https://github.com/sequra/logstash_exporter/releases/download/v7.3.0.0/logstash_exporter-7.3.0.0.linux-amd64.tar.gz
  exec_params: |
    --logstash.endpoint=http://logstash:9600 \
    --web.listen-address=0.0.0.0:8080
- name: node-exporter
  download_url: https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
  exec_params: |
    --web.listen-address=0.0.0.0:8080
```

Example Playbook
----------------

```yaml
---
- name: install and congigure prometheus-exporter
  hosts: servers
  roles:
      - role: prometheus-exporter
```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
