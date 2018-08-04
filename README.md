# `j2y` and `y2j`

Pipe tools to convert json to yaml and yaml to json!

```
$ cat my-file.json | j2y
```

```
$ cat my-file.yaml | y2j
```

Things it can be useful for:

- Making crazy json payloads more readable
- An alternative to `| python -m json.tool`
- Working with K8s manifests

## Installation

```
$ curl https://raw.githubusercontent.com/AstromechZA/j2y2j/master/install.sh | INSTALL_DIRECTORY=~/bin/ sh
```
