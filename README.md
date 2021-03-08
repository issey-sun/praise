# README
![トップ](https://user-images.githubusercontent.com/76093901/108616610-24e41600-7452-11eb-831c-9f03effa7b56.gif)</br></br>

# アプリ名
褒め方辞典</br></br>

# 本番環境
（URL）http://54.178.1.201/
※ゲストログイン機能があります

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


# 開発・学びにおける工夫点
### PDCAサイクルの継続的な循環
![image](https://user-images.githubusercontent.com/76093901/108667954-91781700-751d-11eb-8bd8-8de0a25410bf.png)
</br>


### 学習において5分に１回メモにアウトプット
毎分5分ごとにメモにアウトプットをし、自問自答を繰り返しております。（約300ページ）</br>
メモの内容はRubyやJavaScript、HTML、CSS、プログラミングを行う上でのマインドなどです。</br>
メモは検索機能を使うことでセカンドブレインの役割も果たし、理解の深掘りを効率的に行うことができております。</br>

（メモの一部抜粋）
![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/1052793/830059ad-10dd-d2ca-e80d-71266f9142ec.png)


### HTML, CSS, JavaScriptを使いユーザーを魅了する努力
![レイアウト](https://user-images.githubusercontent.com/76093901/108616673-eb5fda80-7452-11eb-88b3-9245033781a8.gif)</br>
文章を読んでいただくために躍動感のある動作を含めて、ユーザーに楽しさを提供しました。</br>


# 使用技術
Ruby:2.6.5</br> 
Rails:6.0.0</br>
webpacker(fontawesome/css/js/jQuery)</br>
Rspec(systemspec)</br></br>


# DEMO
## トップページにてサービス概要を説明
ユーザーにサービス内容を読んでいただくため、飽きさせないようJavaScript、CSSでメリハリをつけました。
![レイアウト](https://user-images.githubusercontent.com/76093901/108616673-eb5fda80-7452-11eb-88b3-9245033781a8.gif)</br>

## ログイン機能(devise)</br>
![新規登録](https://user-images.githubusercontent.com/76093901/107857241-97605f00-6e70-11eb-964d-13e6cc910b67.gif)</br>

![ログイン](https://user-images.githubusercontent.com/76093901/107857225-73048280-6e70-11eb-941c-7d4102577c05.gif)</br>

## 投稿、編集、削除</br>
![新規投稿、編集、削除](https://user-images.githubusercontent.com/76093901/107857244-a9420200-6e70-11eb-81b9-3ca217e1d314.gif)</br>

## いいね機能(ajax処理)</br>
非同期によりいいねが可能に。最大のいいね数の投稿を表示できるので、ユーザーの参考のメリハリになる。
![いいね](https://user-images.githubusercontent.com/76093901/107857194-3042aa80-6e70-11eb-8082-107e8e6e7686.gif)</br>

## フォロー機能(ajax処理)</br>
フォローすることにより、自分のお気に入りのユーザーの投稿をすぐに閲覧できる。
![フォロー](https://user-images.githubusercontent.com/76093901/107857207-46e90180-6e70-11eb-8b5a-c7b51d50808d.gif)</br>

## 評価機能(ajax処理)</br>
投稿に評価することでフィードバックができ、他者評価から自己の学びにつながる。
![レビュー](https://user-images.githubusercontent.com/76093901/107857217-5e27ef00-6e70-11eb-81ae-de3154b9dcbb.gif)</br>

## 検索機能(ransack)</br>
投稿をキーワード検索ができるため、目的の投稿が探しやすい。
![検索](https://user-images.githubusercontent.com/76093901/107857229-857ebc00-6e70-11eb-8d24-48991016d292.gif)</br>

## ページネーション機能(kaminari)</br>
ユーザーがページが見やすよう投稿は3件表示している。
![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/1052793/6247c994-701d-4bc2-d4a7-57fc7c38a690.png)</br>

## 通知機能</br>
ユーザーがサイト内の状況を知れるよう、いいね、コメント、フォローする、フォローされたら通知される。
![通知](https://user-images.githubusercontent.com/76093901/107857258-bbbc3b80-6e70-11eb-83b1-36c480512c28.gif)</br>


## SNSへのリンク共有機能</br>
より多くのユーザーに本アプリを使ってもらうため、「褒め方辞典」をSNSにて共有ができる。
![SNSリンク共有](https://user-images.githubusercontent.com/76093901/107857154-ff627580-6e6f-11eb-90cf-777e4aaca9b3.gif)</br>

## パンくず機能(gretel)</br>
ユーザーが常にどのページにいるのか、階層ごとに明示している。
![image](https://user-images.githubusercontent.com/76093901/107857332-43a24580-6e71-11eb-8d4c-6471ee88eef0.png)


## 管理者権限</br>
不適切な投稿などを削除できる。
![image](https://user-images.githubusercontent.com/76093901/107857306-0fc72000-6e71-11eb-8906-81afb3520604.png)</br>

## テスト(Rspec/capybara/capybara_screenshot)</br>

テストについてのアウトプットを複数記事にしており、以下のQiitaの記事より確認できます。

https://qiita.com/narimiya/private/58f5dfee2efd9909452a</br>

**その他**</br>
https://qiita.com/narimiya/items/4fa4ee9a19935eba3b94</br>

今後、結合テストなど行っていきます。

# 今後実装したい機能
* Vue.jsを導入してSPA化をすることで更にUXを向上
* chartkickを使用しグラフ機能によるデータの定量分析、及び視える化
* ランキング機能を実装しユーザーのモチベーションを向上


# SNSリンク
Qiita: https://qiita.com/narimiya</br>
twitter: https://twitter.com/NarimiyaIssa</br>
