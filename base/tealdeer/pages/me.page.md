# find

> My custom commands.

- Hard link dirs to a new location: first half creates the dirs (DFS), second half links the files.

`find {{dirA dirB}} -type d -exec mkdir -p {{/new/path/{} }}\; -o -type f -exec ln {{/old/path/{} }}{{/new/path/{} }}\;`
