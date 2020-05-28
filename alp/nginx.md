# Nginx勉強中
​
## 受けるFQDNと流すFQDN（HOST:PORT）
```
    upstream webapp {
        server [流すFQDN];
    }
    server {
        listen [受けるFQDN];
    	listen [::];
    	server_name 0.0.0.0;
    	location / {
            proxy_set_header Host $http_host;
            proxy_pass [流すFQDN];
    	}
    }
```


echo -n > /var/log/nginx/access.log