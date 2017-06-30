+++
tags = []
highlight = true
math = false
date = "2017-06-29T22:38:12-07:00"
title = "Restic Bsckups For The Mere Mortal Part Two"
+++

This is part 2 of our [Restic](http://github.com/restic/restic) overview. Just for review last time we learned that restic is a command line backup tool written in go. We learned how to create a repo to hold our backups (snapshots). We defined environment variables so restic could aitomatical find our repo and the password for that repo. we backed up our documents directory.

Today in part 2 we are going to learn about managing our backups - from here out we will be refering to them as snapshots as that is what restic calls them. You should create a few more snapshots of differnt directories for this to make more sense. Once you have a few snapshots to manage you can view them like so.

```restic snapshots```

The output will be something like this.
```
ID        Date                 Host        Tags        Directory
----------------------------------------------------------------------
bee0e81e  2017-06-29 09:01:24  qawarriorlt          ┌── C:\Users\qawarrior\Documents
                                                    └── C:\work
fec49150  2017-06-29 12:14:29  qawarriorlt              C:\Users\qawarrior\Documents
008949f0  2017-06-29 12:18:39  qawarriorlt              C:\work
6640ae37  2017-06-29 12:25:19  qawarriorlt              C:\Users\qawarrior\Documents
57508869  2017-06-29 12:26:15  qawarriorlt              C:\work
9694309a  2017-06-29 22:43:23  qawarriorlt              C:\work
```
You can also filter your snapshots by add the path to the command.

```restic snapshots --path="C:\Users\qawarrior\Documents```
```
ID        Date                 Host        Tags        Directory
----------------------------------------------------------------------
bee0e81e  2017-06-29 09:01:24  qawarriorlt          ┌── C:\Users\qawarrior\Documents
                                                    └── C:\work
fec49150  2017-06-29 12:14:29  qawarriorlt              C:\Users\qawarrior\Documents
6640ae37  2017-06-29 12:25:19  qawarriorlt              C:\Users\qawarrior\Documents
```

You can even filter by host like so.

```restic snapshots --host qawarriorlt```

Although this only really makes sense with a remote backup repo where you have multiple hosts backing up to say a minio server backed by AWS S3.

Ok now we know how create, list, and filter our sanpshots. Lets learn how to restore a snapshot because "Nobody really wants to backup but everyone wants to be able to restore". First thisng to know is that you can restore a snapshot to any path you choose not just the original path. Restoring a sanpshot looks like so.

```restic restor 6640ae37 --target C:\Users\qawarrior\Restored-Documents```

You can also also use the Latest Key word to restore the latest snapshot. Restore can also be used with the path and host options also. here is a command using them all.

```restic restore latest --target C:\work-restored --path "C:\work" --host qawarriorlt```

Last but not least we need to learn how to remove old snapshots. First there is the forget command which will remove the snapshot from the list but not the data referenced. To remove the data the prune command needs to be call afterwards or use the --prune option with the forget command to have the data automatically reved when forgotten. Like so.

```restic forget bee0e81e --prune```

Our snapshots list now look like so.

```
ID        Date                 Host        Tags        Directory
----------------------------------------------------------------------
fec49150  2017-06-29 12:14:29  qawarriorlt              C:\Users\qawarrior\Documents
008949f0  2017-06-29 12:18:39  qawarriorlt              C:\work
6640ae37  2017-06-29 12:25:19  qawarriorlt              C:\Users\qawarrior\Documents
57508869  2017-06-29 12:26:15  qawarriorlt              C:\work
9694309a  2017-06-29 22:43:23  qawarriorlt              C:\work
```

Ok so we have learned how to manage our sanpshots by listing them, filtering them, restoring them, and removing them. Next time in part 3 we will look at how to simply script and automate the taking of snapshots of our important directory structures.

Enjoy and Get Command!<br>
Paul H Cassidy<br>