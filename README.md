# A repository to demo the `git bisect run` command

./test.sh is the command to run the test

C181 introduce some problem. To run the 

To find the first commit that breaks the test, run the following code:

```bash

> git bisect start
> git bisect bad HEAD

# find the commit id for C101
> git log --grep='C101' --oneline | cat
37f5823 C101 - change another number
> git bisect good 37f5823
Bisecting: 49 revisions left to test after this (roughly 6 steps)
[086697d6e7359d9e8d5478a760e07cd295ffc30b] C150 - some change

> git bisect run bash test.sh
running bash test.sh
Test Passed
Bisecting: 24 revisions left to test after this (roughly 5 steps)
[35d8ef662b82d3d9ece4d78cb07e996182671417] C175 - some change
running bash test.sh
Test Passed
Bisecting: 12 revisions left to test after this (roughly 4 steps)
[69bd28f607c733f0da71a8d30e99ff1be9f6baca] C187 - some change
running bash test.sh
Test Failed
Bisecting: 5 revisions left to test after this (roughly 3 steps)
[94a263f8e014c54fa4715be10fb09864fb15923e] C181 - some change
running bash test.sh
Test Failed
Bisecting: 2 revisions left to test after this (roughly 2 steps)
[fe6062f2e90be523a920796aa0cb08ea8e2a8f8e] C178 - some change
running bash test.sh
Test Passed
Bisecting: 0 revisions left to test after this (roughly 1 step)
[20d83815050683e8d04eba6dbab60ce0b3b57b59] C180 - some change
running bash test.sh
Test Passed
94a263f8e014c54fa4715be10fb09864fb15923e is the first bad commit   # <-- result found
commit 94a263f8e014c54fa4715be10fb09864fb15923e
Author: Jason Ge <gejun_1978@yahoo.comgc
Date:   Tue Oct 1 16:50:32 2019 +0800

    C181 - some change

    Summary: add one line

    Test: none

:100644 100644 a413ec3d7ad61d11032ea57df7859028c8504c65 0240cded988f3be236923bf104fced2f1143b53b M	inventory.csv
bisect run success

> git bisect reset
Previous HEAD position was 20d8381 C180 - some change
Switched to branch 'master'
Your branch is ahead of 'origin/master' by 104 commits.
  (use "git push" to publish your local commits)
```

