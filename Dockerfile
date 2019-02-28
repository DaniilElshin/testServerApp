FROM alpine:3.3

run apk add --update darkhttpd && rm -rf /var/cache/apk/*

ADD linuxTest_Data /var/www/localhost/htdocs/linuxTest_Data
ADD linuxTest.x86_64 /var/www/localhost/htdocs/linuxTest.x86_64

ADD entrypoint.sh /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
