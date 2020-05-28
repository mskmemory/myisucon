# jaeger
各アプリケーション(サービス)のボトルネックを調査するためのツール

## jaegerの特徴
データを処理するためのjaegerサーバとjaegerサーバにデータを送信するjaeger-clientがある
### jaeger

ダウンロード&実行
```
mkdir -p $GOPATH/src/github.com/jaegertracing
cd $GOPATH/src/github.com/jaegertracing
git clone https://github.com/jaegertracing/jaeger.git jaeger
cd jaeger
make install //うまくいかないMakefileにターゲット(install)がない
go run ./examples/hotrod/main.go all
```

### jaeger-client