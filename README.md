
![](https://s3-us-west-2.amazonaws.com/wordpressimageawesome/wp-content/uploads/2016/05/20233805/92833ef89335452c5c76c529fe8430b2.png)

# 使い方

## セットアップ
1. このリポジトリを自分のアカウントへフォークする
2. ローカルにgit cloneする
3. cd student-management
4. `rbenv local 2.3.0` 実行（または 2.3系の任意のバージョンを指定）
  -  rbenvが入っていない人はこちら　→ [Homebrewのインストールとrbenvのインストールまで Mac編](http://qiita.com/issobero/items/e0443b79da117ed48294)
6. `bundle install` 実行
  - PhantomJSが入っていない方はこちら → [Installing PhantomJS](https://github.com/teampoltergeist/poltergeist#installing-phantomjs)
8. `cp config/database-sample.yml config/database.yml` 実行
9. `config/database.yml` を自分の環境に合わせて編集する
10. `bin/rake db:migrate` 実行
11. `bin/rake db:seed` を実行してテストデータを作成
12. `rails s` 実行
13. http://0.0.0.0:3000 にアクセスしてページが開くことを確認
14. `bin/rspec` を実行してテストが全部パスすることを確認

## ログイン方法

テストユーザー用のログイン画面(http://0.0.0.0:3000/users/sign_in)からログインして下さい

- 管理者1: admin1@example.com / 11111111
- 管理者2: admin2@example.com / 11111111
- ユーザー1: user1@example.com / 11111111
- ユーザー2～5: ユーザー1のメールアドレスにある1を2～5に変更する
