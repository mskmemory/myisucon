# Ubuntu18.04における導入
apt install mysql-server mysql-client

# データベースへのアクセス
mysql -h [ホスト名] -u [username] -p

# データベースの選択
use [databasename]
# テーブルのカラムをみる
show columns from [tablename]
