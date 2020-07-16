# README

- Geek Twitterのテンプレです。cloneすれば誰でも、すぐにGeek Twitterを作ることができます。※Dockerがインストールされていることが前提です。

- pre-commit のhookで、commit前に、`$ rubocop --auto-correct`が発火して、rubyコードのエラーチェック＆フォーマットを美しくします。

## バージョン
- Ruby ：　2.6.5
- Rails ：　6.0.3
- DB ：　postgreSQL 

## 最初にやること
```
$ docker-compose build

$ docker-compose run --rm web yarn install --check-files

$ docker-compose run --rm web rails db:create db:migrate

$ git config pre-commit.ruby "docker-compose run --rm web bundle exec ruby"

$ git config pre-commit.checks "[rubocop]"

$ git config pre-commit.rubocop.flags "[-a]"

$ docker-compose run --rm web bundle exec pre-commit install
```

## ポートフォワーディング
以下コマンドを打って、localhost:3000にアクセスしましょう。
```

$ docker-compose up

```
## scssファイルの作り方と、読み込み
- `app/frontend/stylesheets`の中に、コントローラーごとにフォルダを作ってください

- フォルダの中には、`viewの名前に対応したscssファイル`、及び`フォルダ名.scss`を創りましょう

- `フォルダ名.scss`に、 `@import "viewの名前に対応.scss";`  を追記してください。

- `application.scss`で、`@import "フォルダ名.scss";`を追記してください。


詳しくは↓
https://qiita.com/Ryota-Onuma/private/ac0eb20d23b7d2e75fd4
