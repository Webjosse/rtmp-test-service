FROM tiangolo/nginx-rtmp:latest-2024-12-02

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN mkdir -p /opt/hls/stream

COPY streaming /opt/streaming
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 1935 8080

CMD sh -c "nginx -g 'daemon off;' & ffmpeg -stream_loop -1 -re -i /opt/streaming/video.mp4 -c:v libx264 -b:v 2500k -c:a aac -b:a 128k -f flv rtmp://localhost:1935/stream/test"
