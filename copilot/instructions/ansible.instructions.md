Do not use quotes around strings if they don't containt variables.

For example, instead of writing:

```yaml
- name: "Install nginx
```

Do this:

```yaml
- name: Install nginx
```

When writing file modes, prefer named modes over octal ones. For example,
instead of writing:

```yaml
- name: Set permissions on /var/www
  file:
    mode: 0755
```

Write:

```yaml
- name: Set permissions on /var/www
  file:
    mode: 'u=rwx,g=rx,o=rx'
```


Omit ansible.builtin prefix when using modules. For example, instead of writing:

```yaml
- name: Install nginx
  ansible.builtin.yum:
    name: nginx
```
Write:

```yaml- name: Install nginx
  yum:
    name: nginx
```
