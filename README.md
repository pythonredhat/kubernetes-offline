---

- name: set ip forwarding
  sysctl:
    name: net.ipv4.ip_forward
    value: '1'
    state: present
    sysctl_file: /etc/sysctl.conf

- name: ensure net bridge for ipv4
  sysctl:
    name: net.bridge.bridge-nf-call-iptables
    value: '1'
    state: present
    sysctl_file: /etc/sysctl.conf

- name: ensure net bridge for ipv6
  sysctl:
    name: net.bridge.bridge-nf-call-ip6tables
    value: '1'
    state: present
    sysctl_file: /etc/sysctl.conf

