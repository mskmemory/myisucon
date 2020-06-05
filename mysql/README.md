# Ubuntu18.04における導入
apt install mysql-server mysql-client

# データベースへのアクセス
mysql -h [ホスト名] -u [username] -p

# データベースの選択
use [databasename]

# テーブルのカラムをみる
show columns from [tablename]

# 外部からのアクセス許可
`/etc/mysql/mysql.conf.d/mysqld.cnf`の**bind-address**をいじる。（コメントアウトか0.0.0.0に設定すると外部アクセス許可）
