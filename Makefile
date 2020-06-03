INITPATH=`pwd`

all: eset dl_images run_docker

eset:
	# 環境ファイルに現在のパスを追記
	sed -e "s:INITPATH=.*:INITPATH=$(INITPATH):g" app/isu_init.env > app/isu.env

	# isucon環境がない場合はクローン
	@if [ ! -d "./app/isucon9-qualify" ]; then \
		cd $(INITPATH)/app; \
		git clone https://github.com/tken2039/isucon9-qualify.git; \
	fi


dl_images:
	# 初期画像データダウンロード
	@if [ ! -d "$(INITPATH)/upload" ]; then \
		echo "***Get init_data.***"; \
		cd $(INITPATH); \
		curl -LO https://github.com/isucon/isucon9-qualify/releases/download/v2/initial.zip; \
		unzip initial.zip; \
		mv v3_initial_data upload; \
		rm -f initial.zip; \
	fi

	# ベンチマーク用画像データダウンロード
	@if [ ! -d "$(INITPATH)/images" ]; then \
		echo "***Get bench_images.***"; \
		cd $(INITPATH); \
		curl -LO https://github.com/isucon/isucon9-qualify/releases/download/v2/bench1.zip; \
		unzip bench1.zip; \
		mv v3_bench1 images; \
		rm -f bench1.zip; \
	fi

	# 初期設定用データをダウンロード
	@if [ ! -f "$(INITPATH)/app/isucon9-qualify/initial-data/result/initial.sql" ]; then \
		cd $(INITPATH)/app/isucon9-qualify/initial-data; \
		curl -LO https://github.com/mskmemory/myisucon/releases/download/mytag/resource.zip; \
		unzip resource; \
		mv resource/result ./result; \
		mv resource/pwcache ./pwcache; \
		rm -rf resource resource.zip; \
	fi

run_docker:
	# docker-composeの起動
	cd $(INITPATH)
	docker-compose up -d

	# 初期設定用スクリプトの導入
	docker cp ./app/init.sh isu-runner1:/home/app/init.sh
	docker cp ./app/bench.sh isu-runner1:/home/app/bench.sh
	docker cp ./app/init.sh isu-runner2:/home/app/init.sh
	docker cp ./app/bench.sh isu-runner2:/home/app/bench.sh
	docker cp ./app/init.sh isu-runner3:/home/app/init.sh
	docker cp ./app/bench.sh isu-runner3:/home/app/bench.sh

	# 終了通知
	@echo "Setup Complete!"
