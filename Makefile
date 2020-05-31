INITPATH=`pwd`

all: eset dl_images run_docker

eset:
	# 環境ファイルに現在のパスを追記
	sed -e "s:INITPATH=.*:INITPATH=$(INITPATH):g" app/isu_init.env > app/isu.env

	# isucon環境をクローン
	#rm -rf ./isucon9-qualify

	#git clone git@github.com:mskmemory/isucon9-qualify.git

dl_images:
	# 初期画像データダウンロード
	cd $(shell pwd)/isucon9-qualify/webapp/public
	#curl -LO https://github.com/isucon/isucon9-qualify/releases/download/v2/initial.zip
	unzip initial.zip
	rm -rf upload
	mv v3_initial_data upload

	# ベンチマーク用画像データダウンロード
	cd $(shell pwd)/isucon9-qualify/initial-data
	#curl -LO https://github.com/isucon/isucon9-qualify/releases/download/v2/bench1.zip
	unzip bench1.zip
	rm -rf images
	mv v3_bench1 images

run_docker:
	# docker-composeの起動
	cd $(shell pwd)
	docker-compose up
