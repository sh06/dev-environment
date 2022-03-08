FROM redis:6.2.6
RUN mkdir /etc/redis 
ADD conf/* /etc/redis/
WORKDIR /data
EXPOSE 6380
CMD redis-server /etc/redis/redis.conf