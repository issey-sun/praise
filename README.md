# README
![sss.red-miso.work](https://user-images.githubusercontent.com/76093901/106721323-dd831a80-6647-11eb-9c99-e2eeb17346ad.png)</br></br>

# アプリ名
褒め方辞典</br></br>

# 本番環境
（URL）https://praise-homekata.herokuapp.com/

(テストユーザーID/Pass) admin@example.jp/Issei1234</br></br>

# アプリ概要
褒めることを軸に倫理を学び、マネジメントが勉強できるアプリケーションです。

※具体的なアプリの詳細に関しては本アプリ内のトップページに記載しております。</br></br>


# 企画背景
## アプリ開発の軸は「利他」
世の中にいる誰か一人でも救えることができたら、という想いでこちらのアプリを開発しました。</br>

## 開発のきっかけはモチベーションに関するアンケート業務
私は前職の人事・総務で、社内の離職率の原因を調査するため、管理職（上司）に対して実施している部下評価 ※1)の管理、及び監督をしておりました。</br>

直接対象者と面談する中で、管理職の方も、部下のモチベーションを上げたいという利他たる気持ちがあり、</br>
一方部下たちも、上司についていきたいという向上心があることを知っておりました。</br>

この両方の思いをどうにか、叶えたいと切に思っておりました。</br>

## モチベーションを上げる前提と本質を活かすアプリ
マネジメントする前提として、人との信頼関係を構築するために必要な倫理を学ぶ必要があると考えております。</br></br>
そこで、倫理を学び、心理学的に認められた褒め方を軸に、相手のモチベーションを向上させるためのマネジメントが勉強できるアプリを開発しました。</br>

（補足説明）</br>
※1) 部下評価とは部下から上司への評価のこと。頼れる存在なのか、モチベーションが上がる存在なのか等を5段階評価で実施しております。</br></br>


# ターゲットユーザー
## マネジメントに関係する人
マネジメントをする、されるサラーリーマンとして働く人</br>
日常生活でも人間関係を円滑にしたい人</br></br>

# 主な利用シーン
日々の通勤前や仕事と仕事の隙間時間、退社後に、褒め方辞典を開き、毎日の習慣とし倫理と褒め方について学んでいただきます。通知機能を使い、褒め方辞典を習慣化していただきます。</br></br>


# 開発における工夫点
### PDCAサイクルの継続的な循環
より良いサービスにするためには、サービス内容に客観性を持たせる必要があると考え、レビューをN=100受け、レビュー内容を反映しました。</br>

### HTML, CSS, JavaScriptを使いユーザーを魅了する努力
文章を読んでいただく努力をするために躍動感のある動作を含め、ユーザーに楽しさを提供しました。</br>

### 定量・定性分析
「倫理」や「褒め方」には正解がないため、その最適解を定性・定量的に示すためにグラフ機能を用いております。</br></br>

# リリース時の反響
（ここで自身が行ったSNSを活用したPDCAをPR)</br></br>

# 使用技術
Ruby:2.6.5</br> 
Rails:6.0.0</br>
webpacker(fontawesome/css/js/jQuery)</br>
Rspec(systemspec)</br></br>


# DEMO
## トップページにてサービス概要を説明
ユーザーにサービス内容を読んでいただくため、飽きさせないようJavaScript、CSSでメリハリをつけました。
![Top](https://user-images.githubusercontent.com/76093901/107858240-8c103200-6e76-11eb-9212-242286b80a13.gif)</br>

## ログイン機能(devise)</br>
![新規登録](https://user-images.githubusercontent.com/76093901/107857241-97605f00-6e70-11eb-964d-13e6cc910b67.gif)</br>

![ログイン](https://user-images.githubusercontent.com/76093901/107857225-73048280-6e70-11eb-941c-7d4102577c05.gif)</br>

## 投稿、編集、削除</br>
![新規投稿、編集、削除](https://user-images.githubusercontent.com/76093901/107857244-a9420200-6e70-11eb-81b9-3ca217e1d314.gif)</br>

## いいね機能(ajax処理)</br>
非同期によりいいねが可能に。最大いいね数の投稿を別途表示。
![いいね](https://user-images.githubusercontent.com/76093901/107857194-3042aa80-6e70-11eb-8082-107e8e6e7686.gif)</br>

## フォロー機能(ajax処理)</br>
フォローすることにより、自分のお気に入りのユーザーの投稿をすぐに閲覧できる。
![フォロー](https://user-images.githubusercontent.com/76093901/107857207-46e90180-6e70-11eb-8b5a-c7b51d50808d.gif)</br>

## 評価機能(ajax処理)</br>
投稿に評価をすることでフィードバックができ、自身の学びにつながる。
![レビュー](https://user-images.githubusercontent.com/76093901/107857217-5e27ef00-6e70-11eb-81ae-de3154b9dcbb.gif)</br>

## 検索機能(ransack)</br>
投稿記事の内容を検索
タイトルと本文の曖昧検索。
![検索](https://user-images.githubusercontent.com/76093901/107857229-857ebc00-6e70-11eb-8d24-48991016d292.gif)</br>

## ページネーション機能(kaminari)</br>
ユーザーがページが見やすよう投稿は3件表示。
![image](https://user-images.githubusercontent.com/76093901/107857290-f4f4ab80-6e70-11eb-863e-18fb6e8124c7.png)</br>

## 通知機能</br>
ユーザーが日常的にアプリを身近に使ってもらうため、いいね、コメント、フォローする、されたら通知。
![通知](https://user-images.githubusercontent.com/76093901/107857258-bbbc3b80-6e70-11eb-83b1-36c480512c28.gif)</br>


## SNSへのリンク共有機能</br>
より多くのユーザーに本アプリを使ってもらうため、「褒め方辞典」をSNSにて共有が可能に。
![SNSリンク共有](https://user-images.githubusercontent.com/76093901/107857154-ff627580-6e6f-11eb-90cf-777e4aaca9b3.gif)</br>

## パンくず機能(gretel)</br>
ユーザーが常にどのページにいるのか、階層ごとに明示。
![image](https://user-images.githubusercontent.com/76093901/107857332-43a24580-6e71-11eb-8d4c-6471ee88eef0.png)


## 管理者権限</br>
不適切な投稿などを削除できる。
![image](https://user-images.githubusercontent.com/76093901/107857306-0fc72000-6e71-11eb-8906-81afb3520604.png)</br>

## Amazon S3機能</br>

（今後すぐに実装）</br>
・グラフ機能</br>
・ダイレクトメッセージ機能</br>
・テストデータ投入(faker)</br>
・テスト(Rspec)</br>
・ruby構文規約チェックツール(rubocop)</br>
・rails構文規約チェックツール(rubocop-rails)</br>


# インフラ構成

# 今後実装したい機能

# DB設計

# SNSリンク
Qiita: https://qiita.com/narimiya</br>
twitter: https://twitter.com/NarimiyaIssa</br>
