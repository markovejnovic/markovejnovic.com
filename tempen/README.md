# TempEn

TempEn is a simple HTML templating engine. It is very rudimentary and supports
the following:

* Search and Replace
```
<div>%T_NAME</div>
```
can be substituted with `%T_NAME="my content"` to yield
```
<div>my content</div>
```
* Block Definitions
```
{% BLOCK_NAME %}
<div>My custom div</div>
{% END_BLOCK_NAME %}
```

Currently, `TempEn` is only supported through the usage of functions it exposes.
These are:
```bash
te_tr "FIELD" "VALUE" # Replaces the field FIELD with a value VALUE
```
