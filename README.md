# やること


# 本番までにやること
- nginx
- データベース
- カーネルチューニング

# 利用予定のツール一覧
- alp
- netdata //利用方法不明
- pt-query-digest
- jaeger　//調査中

# 明日(6/6)やること
・再現  
・dockerのIPアドレス固定方法  
・docker-cmposeのcommand試したい

# ISUCON9

## 起動方法
①dockerコンテナを起動
``` bash
git clone -b isu9-builder https://github.com/mskmemory/myisucon.git isu9-builder
cd isu9-builder
make
```

**Creating isu-runner ... <span style="color: green">done</span>  
Attaching to isu-runner3, isu-runner1, isu-runner2**  
と出たら次へ。

②コンテナ内に入る（isu-runner1とか指定すること）
``` bash
docker exec -it isu-runner bash
```

③初期セットアップ&初回ベンチ
``` bash
cd /home/app
sh init.sh
```

## 現状の問題点
/initial-dataに入ってdocker動かすところで止まるかもしれない