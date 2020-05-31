# service docker restart
# 初期データ作成
cd /home/isucon9-qualify/initial-data
make

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

cd /home/isucon9-qualify
make 
./bin/benchmarker
