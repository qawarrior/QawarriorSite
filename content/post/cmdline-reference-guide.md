+++
date = "2017-04-17T10:52:54-07:00"
title = "Cmdline Reference Guide"
tags = []
highlight = true
math = false

[header]
  caption = ""
  image = ""

+++

These commands need to be ran from the working directory.

### Go Tool Cmds

1. Build pkg and all sub-pkgs - ```go build -v ./...```

### Git Cmds

1. Stage all files for commit - ```git add --all```
2. Commit to local repo - ```git commit -m "message for commit"```
3. Push to remote repo - ```git push origin master```

### Hugo Site Cmds

1. Run Hugo development server - ```hugo server --watch```