# Ansible init

Inspired from the great [work](https://github.com/davestern/ansible-init) of [Dave Stern](https://github.com/davestern).

Ansible playbook to initialize ansible playbook structure with multiples roles and base examples.

The playbook sets up the common ansible project structure described in the [ansible best practices](http://docs.ansible.com/playbooks_best_practices.html).


## Usage:

Use either of the methods below to set up a local directory and file structure ready for `ansible-playbook` use. All that's needed is to modify the inventory, then add tasks, handlers, files and templates.

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

**roles:** array of roles that should be created

**project_dir:** the directory in which to create the ansible project

**roles_description:** array of roles description that should be created

**author**: your name

**namespace**: galaxy namespaces identifier
