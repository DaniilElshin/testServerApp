FROM alpine:3.3

run apk add --update darkhttpd && rm -rf /var/cache/apk/*

ADD linuxTest_Data /linuxTest_Data
ADD linuxTest.x86_64 /linuxTest.x86_64
ADD output.log /var/www/localhost/htdocs/output.log

CMD /linuxTest.x86_64 -logfile /var/www/localhost/htdocs/output.log & \
	tail -f /var/www/localhost/htdocs/output.log

ADD entrypoint.sh /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
