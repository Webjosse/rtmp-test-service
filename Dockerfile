FROM tiangolo/nginx-rtmp:latest-2024-12-02

RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY streaming /opt/streaming

CMD sh -c "nginx -g 'daemon off;' & ffmpeg -stream_loop -1 -re -i /opt/streaming/video.mp4 -c:v libx264 -b:v 2500k -c:a aac -b:a 128k -f flv rtmp://localhost:1935/live/test"