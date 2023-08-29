# README

## 開発言語
* Ruby 3.0.1
* Ruby on Rails 6.1.7

## カリキュラムの技術
* Gem
* devise (ログイン)
* rails_admin (管理者)
* omniauth-google-oauth2 (googleログイン)

*その他
* お気に入り機能
* フォロー機能
* AWS S3
* heroku

## カリキュラム外の技術
* Gem
* geocoder (緯度経度取得)
* gon (javascript変換)
* http_client (APIの情報取得)
* ransack (検索)
* simple_calendar (カレンダー)
* omniauth-line (LINEログイン)
* mk_sunmoon (月の出、月没時間取得)
* mk_calendar (月齢取得)

* API
* Maps Javascript API (マップ)
* open weather map API (天気予報)
* rakuten travel API (ホテル情報)

* その他
* chart.js (レーダーチャート表示)
* heroku scheduler (定期実行処理)
* bootstrap4 (cssフレームワーク)

## 実行手順
* git clone https://github.com/genergia/StarFinder.git
* cd StarFinder
* bundle install
* yarn add @babel/plugin-proposal-private-methods
* yarn add --dev @babel/plugin-proposal-private-property-in-object
* yarn install
* rails db:create && rails db:migrate
* rake import:star_lights 
* rake import:cities
* rake open_weather_api:weather_forecasts (APIキーが必要です)
* rails s

## チェックシート
https://docs.google.com/spreadsheets/d/17VgaYnN_GRRiCZZYc7RjlfkV79E4i6-XEG17wMIc13k/edit?usp=sharing

## カタログ設計
https://docs.google.com/spreadsheets/d/1Sv1xPKt93eveZDH3BZty6n0g1dT3k1YsbuPGNN1aqKA/edit?usp=sharing

## テーブル定義書
https://docs.google.com/spreadsheets/d/1Z3Jr6FGV1eMw2JdwksX11o-AnSnzXgWjmy8kGfKitPM/edit?usp=sharing

## ワイヤーフレーム
https://drive.google.com/file/d/1InZ6lxTkKvG7lB2JcGeTN2wcF0oJJXmc/view?usp=sharing

## ER図
![ER図](README_images/ER図.png)

## 画面遷移図
![画面遷移図](README_images/画面遷移図.png)
