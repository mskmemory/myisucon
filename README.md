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

# 明日(6/1)やること
https://teratail.com/questions/196533
↑みてdockerの「cached」とCOPYとsyncを試す。

→:cachedためしてみたらめっちゃ早くなってベンチも動いた。

# ISUCON9

## 起動方法
①dockerコンテナを起動
``` bash
git clone -b isu9-builder https://github.com/mskmemory/myisucon.git isu9-builder
cd isu9-builder
make
```

**Creating isu-runner ... done
Attaching to isu-runner**
と出たら次へ。

②コンテナ内に入る
``` bash
docker exec -it isu-runner /bin/sh -c "[ -e /bin/bash ] && /bin/bash || /bin/sh"
```

③初期セットアップ&初回ベンチ
``` bash
cd /home/app
sh init.sh
```

## 現状の問題点
何故かUbuntuコンテナ内でDockerが動いてくれない