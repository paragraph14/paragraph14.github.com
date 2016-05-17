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
マークダウンから HTML を生成してくれるもので、これをサーバーに置くとブログになります。

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
引数にファイル名を与えると、現在の date を現在時刻で埋めてファイルをつくり、かつ vim で編集に入ってくれます。

```bash
if test $# -ne 1; then
    echo "pleas post name"
    exit
fi

frontMatterLine=---
layout="layout: post"
title=title:
pub="published: true"
date="date: `date "+%Y-%m-%d %H:%M:%S +0900"`"
file=_posts/`date +%Y-%m-%d`-${1}.md

touch ${file}

echo $frontMatterLine > $file
echo $layout >> $file
echo $title >> $file
echo $pub >> $file
echo $date >> $file
echo $frontMatterLine >> $file

vim ${file}
```

これを new-post.sh という名前にして、以下のようにやると新しい記事を書きはじめられます。

```bash
% sh ./new-post.sh new-post-filename
```

## 編集する

## 公開する
