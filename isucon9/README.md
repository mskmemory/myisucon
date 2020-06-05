# isucon9-qualifyをローカルで三台構成で動かす
- nginxのロードバランシング、MYSQLの独立の練習を目的に作成
- 一台構成にしたい場合はdocker-compose内のisu9-runner2,isu9-runner3をコメントアウトする


#　ベンチまでの道のり
## ダウンロード
```
git clone git@github.com:mskmemory/myisucon.git -b isu9-builder
docker-compose up
```

## アプリケーションの起動
```
cd app
./init.sh #で動くようにする
```

## benchを回す際の注意点
外部からベンチを動かす際には、shipmentのURLとpaymentのURLを指定する。
ベンチのIPアドレスが`172.20.0.3`の場合は以下のような物になるまだうごきません、手直しが必要です。

```
./bin/benchmarker -target-url http://172.20.0.2:80  -shipment-url http://172.20.0.3:7000 -payment-url http://172.20.0.3:5555
```