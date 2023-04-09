# Ruby on Rails チュートリアルのサンプルアプリケーション

これは、次の教材で作られたサンプルアプリケーションです。
[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)
（第7版）
[Michael Hartl](https://www.michaelhartl.com/) 著

## ライセンス

[Ruby on Rails チュートリアル](https://railstutorial.jp/)内にある
ソースコードはMITライセンスとBeerwareライセンスのもとで公開されています。
詳細は [LICENSE.md](LICENSE.md) をご覧ください。

## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。

```
$ git clone https://github.com/tkogane0626/sample_app.git
```

次に、Dockerイメージの作成とDockerコンテナの起動を行います。

```
$ docker compose up --build
```

最後に、Dockerコンテナ内でDBマイグレーションを実行します。

```
$ docker exec -it sample_app bash
$ rails db:create
$ rails db:migrate
```

詳しくは、[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)
を参考にしてください。
