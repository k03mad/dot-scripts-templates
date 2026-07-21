alias aria="aria2c \
    --continue=true \
    --remote-time=true \
    --check-certificate=false \
    --split=3 \
    --max-connection-per-server=3 \
    --min-split-size=1M \
    --max-tries=12 \
    --retry-wait=5 \
"
alias ytv="yt-dlp \
    -v -o \"%(upload_date)s %(title)s.%(ext)s\" \
    -f \"bv*+?ba/b\" \
    --extractor-args \"youtube:player_client=default,ios\" \
    -S hdr:dv,res,vcodec:av1,acodec:opus,br \
    --sponsorblock-mark all \
    --sponsorblock-remove \"sponsor, selfpromo\" \
    --embed-thumbnail \
    --embed-chapters \
    --embed-metadata \
    --embed-subs \
    --sub-langs all \
"
