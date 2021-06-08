# Ansible init

Inspired from the great [work](https://github.com/davestern/ansible-init) of [Dave Stern](https://github.com/davestern).

Ansible playbook to initialize ansible playbook structure with multiples roles and base examples.

The playbook sets up the common ansible project structure described in the [ansible best practices](http://docs.ansible.com/playbooks_best_practices.html).


## Usage:

Use either of the methods below to set up a local directory and file structure ready for `ansible-playbook` use. All that's needed is to modify the inventory, then add tasks, handlers, files and templates.

```
$ ./create_playbook.sh
 Role author ? Givenname Surname
 Role galaxy namespace ? namespace
 Path to ansible playbook project ? /tmp/ansible-project
 Role name to create ? web
 Role description ? Web server installation and configuration
 Would you create another role ? (y/n) y
 Role name to create ? database
 Role description ? Database engine installation
 Would you create another role ? (y/n) n
```

or directly with `ansible-playbook` with extra-vars

```shell
ansible-playbook \
    init.yml \
    -i production \
    --connection=local \
    --extra-vars='{"roles": 
      [
        { 
          "name": "web",
          "description": "Web server installation and configuration"
        },
        {
          "name": "database",
          "description": "Database engine installation"
        }
      ],
      "project_dir": "/tmp/ansible-project",
      "author": "Givenname Surname",
      "galaxy_namespace": "namespace"
    }'
```

or using a JSON file with variables:

```shell
ansible-playbook \
    init.yml \
    -i production \
    --connection=local \
    --extra-vars='@project.json'
```

Default project JSON file:

```json
{
  "roles": [
    {
      "name": "web",
      "description": "Web server installation and configuration"
    },
    {
      "name": "database",
      "description": "Database engine installation"
    }
  ],
  "project_dir": "/tmp/ansible-project",
  "author": "Givenname Surname",
  "galaxy_namespace": "namespace"
}
```

**roles:** array of key value array with role name and description

**project_dir:** the directory in which to create the ansible project

**author**: your name

**galaxy_namespace**: galaxy namespaces identifier
