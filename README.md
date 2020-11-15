### starting up vagrant VMs:
```
vagrant up
```

### destroying vagrant VMs:
```
vagrant destroy -f
```

### building ansible docker image:
```
docker build . -t ansible
```

### running ansible docker container:
docker image has a copy of the ansible directory, so you can just run:

```
docker run --rm -it ansible
```

you can also use a volume mapping, to test the latest changes:

```
docker run --rm -it -v "$PWD/ansible:/ansible" ansible
```

### setting up docker swarm on VMs:
```
ansible-playbook -i vagrant.ini docker_network.yml
```