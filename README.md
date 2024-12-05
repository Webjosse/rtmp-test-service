# RTMP Test Service

## Deploy the container
```
docker run -d -p 1935:1935 --name rtmp-service webjosse/rtmp-test-service
```

## Test the container
Open VLC, go to  `Media > Open network Stream` and type
```
rtmp://<ip_of_host>:1935/live/test
```
Press Play, you should see the video

## Customize the video
You can use a volume to replace `/opt/streaming/video.mp4`