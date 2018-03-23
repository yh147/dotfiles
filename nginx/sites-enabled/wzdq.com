server {
    listen 443 ssl;
    server_name  njwzdq.com www.njwzdq.com;
    ssl_certificate /etc/letsencrypt/live/njwzdq.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/njwzdq.com/privkey.pem;
    root /home/sites/wzdq;
    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }

    location ~ \.php$ {
        try_files $uri = 404;
        fastcgi_pass   php5;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include        fastcgi_params;
    }
}

server {
    listen 80;
    server_name njwzdq.com www.njwzdq.com;
    return 301 https://$server_name$request_uri;
}
