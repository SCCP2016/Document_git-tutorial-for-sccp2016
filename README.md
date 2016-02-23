My Awesome Book
=======

This file file serves as your book's preface, a great place to describe your book's content and ideas.

# Gitの使い方(超初心者向け)

## よくあるエラー(initialize)
```
$ git init
```
はじめの一歩。カレントディレクトリをgitで管理するためにinitializeするためのコマンド(./.git/が作られる)。initializeされていないディレクトリでgitコマンドを叩くと「使えるわけねえだろ」と殴られる。

## よくあるエラー(add)
```
$ git add <file_name>
```
自分がcommitしたい変更済みのファイルをaddしなければcommitすることはできない。「まずaddしろ」と殴られる。

## commit時の謎
```
$ git commit -m "<commit_message>"
$ git commit
```
-mオプションを付け忘れるとcommit messageを編集するためのエディタが起動する。何も編集せずにエディタを終了すると「commit messageが無いです」と言われて殴られる。

## commit時に保存される情報
* commitユーザー名
* commitユーザーアドレス
* 変更日時
* 変更差分内容
* commit message本文

## しくみ
####ローカルリポジトリ
自分のパソコンの中にある、initializeされたディレクトリのこと。リモートのリポジトリと1対1で紐付けられて、開発しているもののバージョン管理を行う。
####リモートリポジトリ
githubとかbitbucketとかに作られたリポジトリ。ローカルリポジトリの変更内容をpushする対象。

## remoteの指定
```
$ git remote add <remote_repository_name> <remote_repository_url>
```
remoteを追加しないとpushできない。

## conflict
ローカルが最新ではない状態(リモートのリポジトリだけに何らかの変更が加えられている状態)でローカルに別の変更を加えてリモートにpushすると変更が拒否(reject)される。
#### 例
* 1.ローカルとリモートのhoge.txtに
```
Hello, World!!
```
と書いてある状態で、リモートリポジトリのhoge.txtをブラウザ上で以下の内容に直接変更。
```
Hello, World!!
Foo Bar
```
* 2.ローカルリポジトリのhoge.txtを以下の内容に変更。
```
Hello, World!!
JigZag
```
* 3.ローカルの変更をリモートにpushしようとするとローカルとリモートの変更内容がconflictしてrejectされる。

## conflictの解消
```
$ git pull
```
pull後にconflictの対象ファイルを編集してadd, commitし直すと解消できる。

## log
```
$ git log
```
いろいろ履歴が見れる。

## git clone
* httpsURL ... 普通にcloneできる
* sshURL ... 公開鍵を登録しておくとcloneできる。 

#### 公開鍵 is 何
リテラシーでやったアレ。鍵生成して~/.ssh/configをいじればpushをパスワード認証無しで行うことができる。

## branch
最初はmasterブランチ1本だけど、普通masterブランチで作業する人はいないらしい。masterからdevelとかfeature/hogeとか次々切り分けていくとよい。
参考: [Steins;Git](http://o2project.github.io/steins-git/)

## 覚えておくとよいコマンド
```
$ git status
//文字通り変更ステータスが見れる。

$ git branch
//リポジトリに存在するbranchと、今いるbranchを表示する。

$ git branch <branch_name>
//新しいbranchを切る。どこのbranchから切るかも指定できる。

$ git checkout <branch_name>
//既存の別のbranchに移動する
※ 移動前に今いるbranchのcommitとかは全て済ませるようにしよう。

$ git push <remote_repository_name> <local_branch_name>:<remote_branch_name>
//ローカルリポジトリのbranchのcommit内容を対象リモートリポジトリのbranchにpushする。
ローカルかリモートのbranch名と":"を省略するとローカルとリモート共に同名のbranchに対してその操作が行われる。
```