# 注意すること

## DB

```
Error 1055: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'torb.reservations.id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
```

このエラーのため
DBサーバのROOTでログインして以下を実行
```
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
```

go modを利用せずにgbと呼ばれるパッケージ管理ツールを利用している

```
gb vendor fetch [追加したいライブラリ]
```