# docktorrent p@ssw0rd
docker run -it \
    -p 80:80 -p 45566:45566 -p 9527:9527/udp \
    --dns 8.8.8.8 \
    -v /Users/elias/Downloads/Torrents/:/rtorrent/ \
    -e UPLOAD_RATE=1024 \
    kfei/docktorrent