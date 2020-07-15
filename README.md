# README
pre-commit のhookで、commit前に、`$ rubocop --auto-correct`が発火して、rubyコードのエラーチェック＆フォーマットを美しくします。

## 最初にやること
```
$ docker-compose build
$ docker-compose run --rm web yarn install --check-files
$ docker-compose run --rm web rails db:create db:migrate
$ git config pre-commit.ruby "docker-compose run --rm web bundle exec ruby"
$ git config pre-commit.checks "[rubocop]"
$ git config pre-commit.rubocop.flags "[-a]"
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


