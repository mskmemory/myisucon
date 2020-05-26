# netdata

# netdataを利用するまで

```sh
bash <(curl -Ss https://my-netdata.io/kickstart.sh)
```
` enjoy real-time performance and health monitoring...`が表示されるとインストールと実行環境が整う
ポート19999にアクセスしログを確認

## 停止
`service netdata stop`

## 起動
`service netdata start` 


## 設定変更

```sh
//ここを編集する
/etc/netdata/apps_groups.conf
```