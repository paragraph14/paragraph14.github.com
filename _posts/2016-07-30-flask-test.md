---
layout: post
title: "OSS に PR してみたい(テスト編)"
published: true
date: 2016-07-30 23:50:11 +0900
---

わたしも OSS にプルリクエストを送ったりしてみたいけど、怖い。

ということで、どこかに何かしらプルリクエストを送ってマージしてもらう、というのを目標にしてちょっとずつやっていこうとおもいます。今回は手元でテストを実行するまでです。

## 対象
まず OSS を選ばなければいけません。以下のような要素を考慮しました。

* 親しみのある言語で書かれている
* そんなに巨大じゃない
* 使ったことがある
* 活発

[Flask](http://flask.pocoo.org) という python 製の web アプリケーションフレームワークにしました。

> Flask is a microframework for Python based on Werkzeug, Jinja 2 and good intentions. And before you ask: It's BSD licensed!

とのことです。micro と自称するからにはまあそんなに巨大ではないのでしょう、たぶん。

## 今日やること
対象が決まったので環境を構築して手元でテストを実行するところまでやっていきたいとおもいます。

## fork して clone
まず Flask の [github リポジトリ](https://github.com/pallets/flask)に行きます。
右上に **Fork** というボタンがあるので押すと自分のアカウントにコピーが作成されます。

あとはそれを git clone すればよいです。

## python の環境を整える
いい機会なので python の環境を整えましよう。

### pyenv
[pyenv](https://github.com/yyuu/pyenv) は Simple Python version management なソフトです。
python のバージョンを手軽に切り替えられるものです。

github リポジトリの README.md にインスール方法が書いてあるのでそのとおりにやっていきましょう。
こういうときに下手に日本語のブログ記事などを参考にするとはまって時間を無駄にします。

pyenv がイントールできたら、python 3.5.0 をインストールします。
-v オプションは、途中経過を表示させるものです。けっこう時間がかかって不安になるのでつけておきます。

```bash
pyenv install -v 3.5.0
pyenv global 3.5.0
python --version
```

python のインストールができました。

### virtualenv
[virtualenv](https://virtualenv.pypa.io/en/stable/) はプロジェクトごとに python の仮想環境をつくるソフトです。

例によって[公式ドキュメント](https://virtualenv.pypa.io/en/stable/installation/)を見ながらインストールしていきます。

```bash
pip install virtualenv
```

そしてさきほど clone した flask のディレクトリに移動して、仮想環境をつくります。
あとブランチ切っておきます。

```bash
cd flask
git checkout -b dev
virtualenv venv
source venv/bin/activate
```

できました。

## テストを実行する
というわけでソースコードが手に入って python もインストールできました。
とりあえずテストを通してみましょう。

flask の README.md を読むと、pytest というのをつかってテストが書かれているようです。
テストの実行は、

```bash
py.test
```

というコマンドを実行すればいいみたいです。
まずその pytest とやらをインスールしてテストを実行してみましょう。

```bash
pip install pytest
py.test
```

エラーが出ました。

```bash
ImportError: No module named 'flask'
ERROR: could not load ~/flask/tests/conftest.py
```

flask モジュールがインポートできなかったようです。
テスト対象が見つからなかったのでテストできなかったみたいですね。
インスールします。インストールしたら確認します。

```bash
python setup.py install
pip freeze
```

出力結果は以下のように

```bash
click==6.6
Flask==0.11.2.dev0
itsdangerous==0.24
Jinja2==2.8
MarkupSafe==0.23
py==1.4.31
pytest==2.9.2
Werkzeug==0.11.10
```

flask の dev0 バージョンがインストールされたのがわかります。あと依存モジュールもインストールされてます。
テストをやってみましょう。

```bash
py.test
```

出力は

```bash
2 failed, 333 passed, 12 skipped in 13.60 seconds
```

あれ、二個失敗してる・・・眠いのであとは明日やりましょう。
