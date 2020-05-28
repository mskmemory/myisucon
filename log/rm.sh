sudo rm /var/log/nginx/access.log
sudo service nginx restart
sleep 3
sudo rm /var/log/mysql/mysql-slow.log
./bin/benchmarker  -target-url http://127.0.0.1:80