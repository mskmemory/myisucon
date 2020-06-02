# service docker restart
# 初期データ作成
cd /home/isucon9-qualify/initial-data
make

# データベースのセットアップ
cd /home/isucon9-qualify/webapp/sql
service mysql start
# databaseとuserを初期化する
mysql -u root < 00_create_database.sql
# データを流し込む
./init.sh

# Nginxの起動
service nginx start

# アプリケーションの起動
cd /home/isucon9-qualify/webapp/go
export GO111MODULE=on
go build -o isucari
./isucari &

# 初回ベンチマーク
cd /home/isucon9-qualify
make bin/benchmarker
make bin/benchmark-worker
make bin/payment
make bin/shipment
./bin/benchmarker

# # 初期画像データダウンロード
# cd /home/isucon9-qualify/webapp/public
# curl -LO https://github.com/isucon/isucon9-qualify/releases/download/v2/initial.zip
#  unzip initial.zip
#  rm -rf upload
#  mv v3_initial_data upload

# # ベンチマーク用画像データダウンロード
# cd /home/isucon9-qualify/initial-data
# curl -LO https://github.com/isucon/isucon9-qualify/releases/download/v2/bench1.zip
# unzip bench1.zip
# rm -rf images
# mv v3_bench1 images


# cd /home/isucon9-qualify
# make 
# ./bin/benchmarker