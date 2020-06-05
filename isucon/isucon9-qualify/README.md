# isucon9-qualifyをローカルで三台構成で動かす
- nginxのロードバランシング、MYSQLの独立の練習を目的に作成
- 一台構成にしたい場合はdocker-compose内のisu9-runner2,isu9-runner3をコメントアウトする(下の方のcpも)


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
path/to/isucon9-qualify上で実行すること！

### ローカルで回す
そのまま↓まわす。

```
./bin/benchmarker
```

nginxかましてポートが変わっている場合は

```
./bin/benchmarker -target-url http://localhost:80
```

とかする。

### 外部から回す
まず、**ベンチ回される側**でpaymentとshipmentサービスの起動

```
./bin/payment &
./bin/shipment &
```

外部からベンチを動かす際には、shipmentのURLとpaymentのURLを指定する。
例えば、ベンチ対象のIPアドレスが`172.20.0.2`、ベンチ側のIPアドレスが`172.20.0.3`の場合は以下のように設定する。（後部２つのオプションはベンチ側のIPアドレスを必ず指定すること。localhostはダメ。）

```
./bin/benchmarker -target-url http://172.20.0.2:80  -shipment-url http://172.20.0.3:7000 -payment-url http://172.20.0.3:5555
```