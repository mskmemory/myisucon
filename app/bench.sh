TARGET=
SHIPMENT=

# nginxのリロード
nginx -s reload 
sleep 1

# ベンチ回す
./home/isucon9-qualify/bin/benchmarker \
-targer-url $TARGET
# -shipment-url $SHIPMENT

