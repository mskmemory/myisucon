# やること


# 本番までにやること
- nginx
- データベース
- カーネルチューニング
- redis

# 利用予定のツール一覧
- alp
- netdata //利用方法不明
- pt-query-digest
- ~~jaeger(Stackdriver tracer,profiler)　//調査中~~

# 使えそうなサイト
- https://gist.github.com/south37/d4a5a8158f49e067237c17d13ecab12a  
DB，Nginx，OSのチューニングについて書いてある

## 現状の問題点
/initial-dataに入ってdocker動かすところで止まるかもしれない


## 注意すること
- DBの初期化処理を見る
- 元のメソッドは残す(変更時の影響範囲を見極めることが難しいため)
- 多重化している部分を注意深くみて分析する。

## 今後の課題
- query秒とループとどちらの方がどのくらい速いのかをしらべる
- nginxの静的ファイルのキャッシュの設定 <--msk
- カーネルチューニングの設定(https://gist.github.com/matsukaz/806a006f60a3cbde255dbb6e651f3555#file-md) <--tken
- IN句の利用
- JOIN,UNIONの使いこなす
