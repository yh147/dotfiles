server {
    listen 443 ssl;
    server_name  njwzdq.com www.njwzdq.com;
    ssl_certificate /etc/letsencrypt/live/njwzdq.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/njwzdq.com/privkey.pem;
    root /home/sites/wzdq;
    index index.php index.html;

    location / {
		if (!-e $request_filename) {
            rewrite  ^/(.*)$  /index.php/$1  last;
            break;
        }
    }

    location ~ \.php {
        try_files $uri = 404;
        fastcgi_pass   php5;
        #fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include        fastcgi_params;
		set $real_script_name $fastcgi_script_name;
		if ($fastcgi_script_name ~ "^(.+?\.php)(/.+)$") {
			set $real_script_name $1;
			set $path_info $2;
        }
        fastcgi_param SCRIPT_FILENAME $document_root$real_script_name;
        fastcgi_param SCRIPT_NAME $real_script_name;
        fastcgi_param PATH_INFO $path_info;
    }
}

server {
    listen 80;
    server_name njwzdq.com www.njwzdq.com;
    return 301 https://$server_name$request_uri;
}
