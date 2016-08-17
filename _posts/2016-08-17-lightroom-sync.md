---
layout: post
title: lightroom CC と lightroom mobile の同期の挙動について
published: true
date: 2016-08-17 07:20:38 +0900
---

Lightroom CC の同期の挙動がよくわからなかったので調べました。

## TL;DR
* 写真は Lightroom mobile に取り込む
* CC を通してデスクトップにオリジナルデータが転送される
* 編集情報は同期される
* モバイル側でオリジナルデータを消してもデスクトップ側には影響がない

## 環境
* lightroom CC 2016.6.1
* lightroom mobile
* windows 8
* iOS 9

## iPhone →Lightroom mobile 
iPhone で撮った写真や lightning SD カードリーダーでとりこんだ写真をアプリの Lightroom mobile にとりこみます。
Lightroom mobile にとりこんだ後は、iOS 純正の写真アプリで元データを削除しても影響ありません。

## Lightroom mobile → Creative Cloud → Lightroom CC
PC・mac の Lightroom CC を起動すると、同期が始まり、Lightroom mobile でとりこんだ写真が同期されます。
同期と一口に表現されますが、おそらくこのときの元データの転送と編集情報の同期が行なわれています。
ライブラリフォルダを確認すると、写真の元データが保存されていることがわかります。

## 編集
mobile、CC どちらで編集しても編集情報は同期されます。

## mobile 側で写真を削除
iPhone のストレージが厳しくなってたらどうしましょう、写真を削除しましょう。
Lightroom mobile アプリから写真を削除します。

このとき Lightroom CC 側のデータには影響がありません。元データも編集情報も残ります。

## Lightroom CC → Creative Cloud → Lightroom mobile
Lightromm CC で同期したい写真を指定すると、Lightroom mobile に同期されます。
このとき同期されるのは元データではなく DNG という独自形式のファイルです。

## まとめ
要するに、デジカメの写真も iPhone か iPad でとりこんで、ストレージが足りなくなってきたら消してしまえばいいというかんじです。

## 未検証
* Lightroom CC が複数台ある場合
* Lightroom mobile でとりこみ同期したあと、Lightroom CC で同期する前に写真を削除した場合

## ダメなパターン
Lightroom mobile でとりこみ同期したあとに iPhone を PC につなげて元データを Lightroom CC でとりこむとファイルが二重になる。

