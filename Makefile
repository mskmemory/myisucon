INITPATH=`pwd`
dir_name = isucon9-qualify
dir_exists = $(shell ls | grep ${dir_name})

all: eset dl_images run_docker

eset:
	# 環境ファイルに現在のパスを追記
	sed -e "s:INITPATH=.*:INITPATH=$(INITPATH):g" app/isu_init.env > app/isu.env

	# isucon環境がない場合はクローン
	@if [ ! -d "./isucon9-qualify" ]; then \
		git clone https://github.com/tken2039/isucon9-qualify.git; \
	fi


dl_images:
	# 初期画像データダウンロード
	cd $(INITPATH)/isucon9-qualify/webapp/public
	#curl -LO https://github.com/isucon/isucon9-qualify/releases/download/v2/initial.zip
	unzip initial.zip
	rm -rf upload
	mv v3_initial_data upload

	# ベンチマーク用画像データダウンロード
	cd $(INITPATH)/isucon9-qualify/initial-data
	#curl -LO https://github.com/isucon/isucon9-qualify/releases/download/v2/bench1.zip
	unzip bench1.zip
	rm -rf images
	mv v3_bench1 images

run_docker:
	# docker-composeの起動
	cd $(INITPATH)
	docker-compose up
