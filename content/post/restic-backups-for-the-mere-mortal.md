+++
tags = []
highlight = true
math = false
date = "2017-06-29T10:41:28-07:00"
title = "Restic Bsckups For The Mere Mortal Part One"
+++

[Restic](http://github.com/restic/restic) is a command line backup tool written in Google go language. This tool totally rocks. You start by defining a backup repository that can be a local file system path, SFTP server, AWS S3, Minio server backed by S3, or various other ways. Restic is open source and has docs on how to expand its capabilities like adding your own backup target perhaps a SQL Database, etc. Lets look at a simple example of creating a local repo for the backups. We asseme that restic is in your path and can be call by name.

```restic init --repo F:\Backups```

When you define the repository restic will prompt you for a password and then again to confirm that password. The repo and the data it contains is encrypted and secure. Once the repo is created you have some choices before moving forward you can backup file system paths.

```restic -r F:\Backups backup C:\users\qawarrior\documents```

This will prompt you for your passward and then backup the users documents directory. this is fast and nice but not really suited to automated backups. So to make it a little more automation friendly we will define the environment variable "RESTIC_PASSWORD" and assign it the value of our repo's password. Now the backup command is entered same as before but we are not prompted for our password.

The Command is still a bit verbose as we have to enter the path to our backup repo each time. The command is still quite redundant. So to remove this we will define the "RESTIC_REPOSITORY" environment variabke with the value of the path to our backup repo. Now the backup command is this.

```restic backup C:\users\qawarrior\documents```

Now restic uses our defined repo and password to backup the documents directory. we can call restic now with differing filepaths or a comma seperated list of paths and it just works. this allows us to create scripts (bash, bat, powershell, etc) to perform our backs from differing locations to our repo.

In part 2 I will go over viewing snapshots (restic's name for each backup) and managing snapshots.

Enjoy and Get Command<br>
Paul H Cassidy (qawarrior)
