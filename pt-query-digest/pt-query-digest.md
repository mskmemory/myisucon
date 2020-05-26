

## 使えるまで

### インストール
```
sudo apt-get install percona-toolkit
```

### mysqlの設定


```
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf 
```

二行目からコメントアウト外す(７６行目付近)
```
# Here you can see queries with especially long duration
slow_query_log          = 1
slow_query_log_file     = /var/log/mysql/mysql-slow.log
long_query_time = 2
log-queries-not-using-indexes
```

## 再起動

```
service mysql restart
```


# 多分見方

```
# Rank Query ID           Response time Calls R/Call V/M   Item
# ==== ================== ============= ===== ====== ===== ============
　影響度　　　　　　　　　　　　　時間　　　　　　回数　　時間/回数　　　　　
```

```
# Attribute    pct   total     min     max     avg     95%  stddev  median
# ============ === ======= ======= ======= ======= ======= ======= =======
# Count          7      97
# Exec time     23     35s    77ms   711ms   358ms   609ms   155ms   374ms
# Lock time     15    12ms    25us     3ms   118us   515us   364us    28us
# Rows sent      6   4.64k      49      49      49      49       0      49 //クライアントに送られる数(limitコマンド)
# Rows examine  16   4.63M  48.88k  48.89k  48.89k  46.68k       0  46.68k //実際に抽出されるレコード数
# Query size    16  24.20k     249     257  255.43  246.02       0  246.02
```