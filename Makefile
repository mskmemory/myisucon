INITPATH=`pwd`

run:
	# 環境ファイルに現在のパスを追記
	sed -e "s:INITPATH=.*:INITPATH=$(INITPATH):g" app/isu_init.env > app/isu.env

	# isucon環境をクローン
	git clone https://github.com/tken2039/isucon9-qualify.git

	# docker-composeの起動
	docker-compose up