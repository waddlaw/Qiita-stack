# Qiita-stack

このリポジトリは「[本気で Haskell したい人向けの Stack チュートリアル](https://qiita.com/waddlaw/items/49874f4cf9b680e4b015)」のサンプルコード置き場になります。

## 検証環境

```shell
$ lsb_release -d -c
Description:    Ubuntu 18.04.1 LTS
Codename:       bionic
```

```shell
$ stack --numeric-version
2.1.3
```

```shell
$ cat stack.yaml | head -n 1
resolver: lts-13.29
```

## ビルド方法

```shell
# ビルド
$ stack build

# テスト
$ stack test

# haddock
$ stack haddock

# ベンチマーク
$ stack bench
```
