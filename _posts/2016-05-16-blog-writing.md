---
layout: post
title: Blog を書くためのものとか
published: false
date: 2016-05-16 00:55:04 +0900
---

これを読んでいる方はご存知かもしれませんが、わたしはブログを書いています。

環境が固まってきたのでまとめてみます。

## 生成する
[jekyll](http://jekyllrb-ja.github.io/) という静的サイトジェネレータを使っています。
マークダウンから HTML を生成してくれるもので、これをサーバーに置くと Blog になります。

## 置く
Blog は [github pages](https://pages.github.com/) に置いてあります。
github pages のいいところは jekyll に対応してくれているところで、必要なファイル群をアップすると jekyll を使って自動でサイトを生成してくれます。

## 記事を書く
1記事1マークダウンファイル、という感じで書きます。ファイルの先頭に属性を表わす Front Matter というのを書かなくてはいけません。
こういう感じのものです。それぞれタイトルとか書いた時刻とかを表しています。

```
---
layout: post
title: Blog を書くためのものとか
published: true
date: 2016-05-16 00:55:04 +0900
---
```

いちいち手書きするのもだるいのでシェルスクリプトでやっています。
引数にファイル名を与えると、date を現在時刻で埋めてファイルをつくり、かつ vim で編集に入ってくれます。

<script src="https://gist.github.com/paragraph14/832dcfd5c4eb307c562cb4032d3201ff.js"></script>

これを new-post.sh という名前にして、以下のようにやると新しい記事を書きはじめられます。

```bash
% sh ./new-post.sh new-post-filename
```

## 編集する
書いたけどまだ公開したくないときは front matter で published: false としておくと jekyll のビルドに含まれなくなります。

ところで以前書いた記事を編集しようというとき、ファイル一覧から探すのがちょっとめんどくさいので peco をつかってちょっとだけ便利にしています。

<script src="https://gist.github.com/paragraph14/b1a84e39a2eb2370cbf5ee97782c8a86.js"></script>

published: false になっている記事だけ表示するのもあります。

<script src="https://gist.github.com/paragraph14/72d8cf9ffbd6e76cc745de3f045c8cdd.js"></script>


## 公開する
記事ができたらあとは push するだけです。

<script src="https://gist.github.com/paragraph14/811987bf5eb6930fb25d2ad0f7aae19b.js"></script>

