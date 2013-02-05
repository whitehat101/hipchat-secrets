hipchat-secrets
===============

Decode the weakly crypted password from the hipchat configuration file. The API allows decoding/encoding but the wrapper script only decodes passwords. See the specs, if you care.

## Prerequsite: Find the HipChat Secret

1. Discover Hipchat's Secret Hashing key. You're on your own for this.
1. Put the secret in ~/.hipchat_secret or in your environment, HIPCHAT_SECRET
1. …
1. Profit!

## Example Usage

```
$ hipchat-secrets
Analyzing HipChat config: /Users/xxx/Library/Preferences/com.hipchat.xxx/Local Store/hipchatConfig.json

xxx@xxx.com's password is xxx
```



```
$ hipchat-secrets /some/other/file/that/was/a/hipchatConfig.json
Analyzing HipChat config: /some/other/file/that/was/a/hipchatConfig.json

xxx@xxx.com's password is xxx
```




```
$ HIPCHAT_SECRET=IFoundTheSecret hipchat-secrets /some/other/file/that/was/a/hipchatConfig.json
Analyzing HipChat config: /some/other/file/that/was/a/hipchatConfig.json

xxx@xxx.com's password is xxx
```


## Come on Atlassian

Seriously. Your password _encryption_ is hardly better than plaintext. Use real encryption to protect secrets.
