#!bin/bash

# Create initial data.
cd /home/isucon9-qualify/initial-data
make

# Setup Database.
service mysql start
cd /home/isucon9-qualify/webapp/sql
mysql -u root < 00_create_database.sql
# Pour the data.
./init.sh

# Run application.
cd /home/isucon9-qualify/webapp/go
export GO111MODULE=on
go build -o isucari
./isucari &

# The first benchmark test.
cd /home/isucon9-qualify
make bin/benchmarker
make bin/benchmark-worker
make bin/payment
make bin/shipment
./bin/benchmarker