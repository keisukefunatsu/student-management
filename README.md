
![](https://s3-us-west-2.amazonaws.com/wordpressimageawesome/wp-content/uploads/2016/05/20233805/92833ef89335452c5c76c529fe8430b2.png)
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
# 使い方

## セットアップ
1. このリポジトリを自分のアカウントへフォークする
2. ローカルにgit cloneする
3. cd student-management
4. `rbenv local 2.3.0` 実行（または 2.3系の任意のバージョンを指定）
  -  rbenvが入っていない人はこちら　→ [Homebrewのインストールとrbenvのインストールまで Mac編](http://qiita.com/issobero/items/e0443b79da117ed48294)
5. `gem install bundler` 実行
  - `bundler -v` で 1.12.5 以上がインストールされていることを確認
6. `bundle install` 実行
  - PhantomJSが入っていない方はこちら → [Installing PhantomJS](https://github.com/teampoltergeist/poltergeist#installing-phantomjs)
8. `cp config/database-sample.yml config/database.yml` 実行
9. `config/database.yml` を自分の環境に合わせて編集する
10. `bin/rake db:migrate` 実行
11. `bin/rake db:seed` を実行してテストデータを作成
12. `cp .env-sample .env` 実行
12. `.env` ファイルを開き、`GOOGLE_CLIENT_ID`と`GOOGLE_CLIENT_SECRET`を設定
  - 具体的な設定値は別途連絡します。
12. `rails s` 実行
13. http://localhost:3000 にアクセスしてページが開くことを確認
14. `bin/rspec` を実行してテストが全部パスすることを確認

## ログイン方法

### メールアドレスによるログイン

テストユーザー用のログイン画面( http://localhost:3000/users/sign_in )から、以下のいずれかのアカウントでログインしてください。

- 管理者1: admin1@example.com / 11111111
- 管理者2: admin2@example.com / 11111111
- ユーザー1: user1@example.com / 11111111
- ユーザー2～5: ユーザー1のメールアドレスにある1を2～5に変更する

### Gmailアカウントによるログイン

トップページ( http://localhost:3000/ )にある「Googleでサインイン」ボタンをクリックしてください。

## 本家の最新のソースに追従する手順

1. `git remote add upstream https://github.com/keisukefunatsu/student-management.git` を実行し、本家リポジトリをupstreamという名前のリモートリポジトリとして登録する。（最初の1回のみ）
2. `git checkout master` を実行
3. `git fetch upstream` を実行
4. `git merge upstream/master` を実行
5. `bundle install` を実行（Gemfileが変更されていた場合）
6. `bin/rake db:migrate` を実行（migrationが追加されていた場合）

## 初期データを入れ直す手順

初期データを入れ直す場合は以下のコマンドを実行する。ただし、開発環境のデータが全部リセットされるので、データが消えても問題ないか実行前に確認すること。

`bin/rake db:setup`
