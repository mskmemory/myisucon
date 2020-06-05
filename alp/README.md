# NginxのログをALPで見るまでの道のり
​
## ALPとは
ちまたで有名なアクセスログ解析ツール。
​
## ①alpのインストール
ソースから最新版を取得
``` bash
$ curl -L -O https://github.com/tkuchiki/alp/releases/download/v1.0.3/alp_linux_amd64.zip
$ unzip alp_linux_amd64.zip
$ sudo mv alp /usr/bin/alp
```
​
## ②Nginxのログ出力設定
### ログフォーマットを定義（lstv）
httpコンテキスト内に以下を記述
```
http {
    (省略)
    log_format ltsv "time:$time_local"
                    "\thost:$remote_addr"
                    "\tforwardedfor:$http_x_forwarded_for"
                    "\treq:$request"
                    "\tstatus:$status"
                    "\tmethod:$request_method"
                    "\turi:$request_uri"
                    "\tsize:$body_bytes_sent"
                    "\treferer:$http_referer"
                    "\tua:$http_user_agent"
                    "\treqtime:$request_time"
                    "\tcache:$upstream_http_x_cache"
                    "\truntime:$upstream_http_x_runtime"
                    "\tapptime:$upstream_response_time"
                    "\tvhost:$host";
    （省略）
}
```
​
### ログ出力形式の設定
```
access_log /var/log/nginx/access.log ltsv;
```
​
### Nginxの再起動
``` bash
$ sudo service nginx restart
# または
$ sudo systemctl restart nginx
```
​
## ALPの実行
``` bash
$ cat /path/to/access.log | alp ltsv
```
​
### 特定の項目を抽出したい
-oオプションで項目名を指定
``` bash
$ cat /path/to/access.log | alp ltsv -o [<項目名>, ...]
```
​
例
``` bash
$ cat /path/to/access.log | alp ltsv -o uri
$ cat /var/log/nginx/access.log |alp ltsv -o count,uri,avg,method --sort=avg --reverse|head -10
```