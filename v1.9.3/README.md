# v1.9.3

## 検証環境

```shell
$ lsb_release -d -c
Description:    Ubuntu 18.04.1 LTS
Codename:       bionic
```

```shell
$ stack --numeric-version
1.9.3
```

```shell
$ cat stack.yaml | head -n 1
resolver: lts-13.1
```

## ビルド方法

```shell
# ビルド
$ stack build

# テスト
$ stack test

# haddock
$ stack haddock
```
