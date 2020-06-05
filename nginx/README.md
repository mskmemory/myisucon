# Nginx勉強中
​
## ロードバランシング周り
```
upstream webapp {
    # Hosts for load balancing.
    server HOST-PORT;
    #server HOST-PORT;
    #server HOST-PORT;
}
server {
    # Listen port.
    listen PORT;

    # ToDo: Research
    listen [::];

    # ToDo: Research
    server_name 0.0.0.0;
    location / {
        # ToDo: Research
        proxy_set_header Host $http_host;
        proxy_set_header True-Client-IP $remote_addr;
        proxy_set_header Connection "";
        proxy_http_version 1.1;

        # Specify the network to send packets.
        proxy_pass http://webapp;
    }

    
}
```


echo -n > /var/log/nginx/access.log