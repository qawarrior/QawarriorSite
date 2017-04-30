+++
date = "2017-04-17T10:52:54-07:00"
title = "Cmdline Reference Guide"
tags = ["Tools", "Commands"]
highlight = true
math = false

[header]
  caption = ""
  image = ""

+++

Theses commands need to be found in the path environment variable.

### Go Tool Commands
Ran from the root of the main package. <br>

1. Build package and all sub-packages:<br>
```go build -v ./...```

### Git Commands
Ran from root of git repository. <br>

1. Stage all files for commit:<br>
```git add --all```
2. Commit to local repository:<br>
```git commit -m "message for commit"```
3. Push to remote repository:<br>
```git push origin master```
4. Pull from remote repository:<br>
```git pull origin master```

### Hugo Site Commands
Ran from root of hugo site. <br>

1. Create a new hugo site template:<br>
```hugo new site "site name"```
2. Run Hugo development server:<br>
```hugo server --watch```
3. Generate static site (defaults to ./public):<br>
```hugo```

### MongoDB Commands
Ran from the database root unless path is specified in command. <br>

1. Run the server with path to database:<br>
```mongod --dbpath .\db```