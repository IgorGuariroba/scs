Git Remove large File Size

```
remote: error: GH001: Large files detected. You may want to try Git Large File Storage — https://git-lfs.github.com.
remote: error: Trace: b5116d865251981c96d4b32cdf7ef464
remote: error: See http://git.io/iEPt8g for more information.
remote: error: File fixtures/11_user_answer.json is 131.37 MB; this exceeds GitHub’s file size limit of 100.00 MB
```

### Exec command:

```
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch fixtures/11_user_answer.json'
```
