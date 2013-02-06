hipchat-secrets
===============

Decode the weakly crypted password from the hipchat configuration file. The API allows decoding/encoding but the wrapper script only decodes passwords. See the specs, if you care.

## Prerequsite: Find the HipChat Secret

1. Discover Hipchat's Secret Hashing key. You're on your own for this.
1. Put the secret in ~/.hipchat_secret or in your environment, HIPCHAT_SECRET
1. …
1. Profit!

## Example Usage

Automagical:

```
$ hipchat-secrets
Analyzing HipChat config: /Users/xxx/Library/Preferences/com.hipchat.xxx/Local Store/hipchatConfig.json

xxx@xxx.com's password is xxx
```

With non-standard config file location:

```
$ hipchat-secrets /some/other/file/that/was/a/hipchatConfig.json
Analyzing HipChat config: /some/other/file/that/was/a/hipchatConfig.json

xxx@xxx.com's password is xxx
```

With secret from environment:

```
$ HIPCHAT_SECRET=IFoundTheSecret hipchat-secrets
```

Windows:

```
> env HIPCHAT_SECRET=IFoundTheSecret hipchat-secrets
```


## Tested against

- 1.8.7-p371
- 1.9.2-p320
- 1.9.3-p374
- 2.0.0-rc1
- jruby-1.7.0
- jruby-1.7.2


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Come on Atlassian

Seriously. Your password _encryption_ is hardly better than plaintext. Use real encryption to protect secrets.
