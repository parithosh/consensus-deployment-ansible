cAdvisor
========

[![Actions Status](https://github.com/ome/ansible-role-cadvisor/workflows/Molecule/badge.svg)](https://github.com/ome/ansible-role-cadvisor/actions)
[![Ansible Role](https://img.shields.io/ansible/role/41399.svg)](https://galaxy.ansible.com/ome/cadvisor/)

cAdvisor container monitoring.

cAdvisor can be run in a [Docker container](https://github.com/google/cadvisor), however on RHEL/CentOS it requires [additional flags](https://github.com/google/cadvisor/blob/master/docs/running.md).
An alternative is to run it directly on the host system using this role.


Variables
=========

Optional:
- `cadvisor_port`: Listen on this port, default `9280`
- `cadvisor_version`: Cadvisor version, default `v0.29.0`
- `cadvisor_binary_local_dir`: Cadvisor binary file directory when running without connection to external, default `""`
- `cadvisor_checksum`: SHA256 checksum, default `f5c8deb31eb12cae38007f0f4a208e0b9ba2b2ad6a1c9610b32d113221880d4eP`


Example playbook
----------------

```yaml
- hosts: localhost
  roles:
    - role: ome.cadvisor
```


# For overwrite default variables

```yaml
- hosts: localhost
  vars:
    cadvisor_port: 9100
    cadvisor_version: v0.28.3
    cadvisor_checksum: daf4543dc1bc39e8234060376bf4946609b0f6108bdecbdf5ffd239e67664eb3

  roles:
    - ansible-role-cadvisor
```


Author Information
------------------

ome-devel@lists.openmicroscopy.org.uk
