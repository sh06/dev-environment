FROM redis:5.0.12-alpine3.13
RUN mkdir /etc/redis 
ADD conf/* /etc/redis/
WORKDIR /data
EXPOSE 6379
CMD redis-server /etc/redis/redis.conf