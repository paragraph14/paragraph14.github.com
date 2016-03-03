---
layout: post
title: "qFixHowm で markdown"
date: 2016-03-03 14:39:54 +0900
published: false
---

qFixHownでmarkdownでメモをとりたかった。

* [qfixhowm](https://sites.google.com/site/fudist/Home/qfixhowm)

## インストール

NeoBundle をつかっています。

```vimrc
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'godlygeek/tabular'
```

## qFixhowm の設定

拡張子mdをmarkdownとして設定する。

```vimrc
au BufRead,BufNewFile *.md set filetype=markdown
```

qFixhowmの拡張子をmdにする。

```vimrc
" qFixhowmの拡張子をmdにする。
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.md'

" ファイルタイプをmarkdownに変更
let QFixHowm_FileType = 'markdown'

" タイトル記号を # に変更する
let QFixHowm_Title = '#'
```

## 使い方

1. g,c でメモ作成
1. 書く
1. :PreVimOpen でプレビュー
1. 書く

## 過去のメモの処理

タイトル記号を "=" から "#" に変更すると、過去に作成したメモのタイトルが認識されなくなってしまう。
シェルで適当に置換しました。

## PreVimOpen がうごかない

PreVimOpen が動かない問題があるようです。

[コマンドprevimを実行してもブラウザが開かない](https://github.com/kannokanno/previm/issues/46)


## 参考
https://sites.google.com/site/fudist/Home/qfixhowm/tips/vimwiki  
http://uguisu.skr.jp/Windows/find_xargs2.html  
http://qiita.com/kkyouhei/items/b4ff839a2f36ba194df3  

