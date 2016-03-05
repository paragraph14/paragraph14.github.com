#!/bin/sh

# ---
# layout: post
# title:
# date:   2016-03-01 11:32:52 +0900
# ---

if test $# -ne 1; then
    echo "pleas post name"
    return 0
fi

frontMatterLine=---
layout="layout: post"
title=title:
pub="published: true"
date="date: `date "+%Y-%m-%d %H:%M:%S +0900"`"
file=_drafts/${1}.md

touch ${file}

echo $frontMatterLine > $file
echo $layout >> $file
echo $title >> $file
echo $pub >> $file
echo $date >> $file
echo $frontMatterLine >> $file