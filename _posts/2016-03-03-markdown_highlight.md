---
layout: post
title: "vim-markdown のシンタックスハイライトが便利"
date: 2016-03-03 14:55:06 +0900
published: true
---

vim で markdown を書くのに [vim-markdown](https://github.com/plasticboy/vim-markdown) を使っています。
久しぶりにアップデートしたら、Fenced code block 内がシンタックスハイライトされるようになっていて、便利というか見やすいです。

これが

![nohl]({{ site.baseurl }}/assets/vim-markdown-nohl.jpg)

こうなる

![hl]({{ site.baseurl }}/assets/vim-markdown-hl.jpg)

あとさっき見つけたけど

```vimrc
let g:vim_markdown_frontmatter = 1
```

とすると YAML front matter をハイライトしてくれる。
これもとてもいいです。
