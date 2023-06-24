# Ansible provision for my workstation

## Usage

On a fresh [Debian](https://cdimage.debian.org/debian-cd/current/amd64/bt-dvd/) installation,
upgrade the system and then run:

```
bash bootstap.sh
ansible-playbook -K main.yml
```

Playbooks are grouped by categories in `playbooks` dir. The playbook `main.yml` is a wrapper for
running all playbooks at once. To run specific playbooks pass their filenames to `ansible-playbook`, eg.

```
ansible-playbook -K playbooks/go.yml playbooks/user.yml
```

## Compatibility

Tested on **Debian 12 (Bookworm)**.

## License
Licensed under the [MIT license](http://opensource.org/licenses/MIT)

Read [LICENSE](LICENSE) for more information


https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html#ansible-collections-ansible-builtin-apt-module
