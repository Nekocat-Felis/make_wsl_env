#!/bin/bash

# TurboVNC をパスワードなしで 2K 解像度で起動
/opt/TurboVNC/bin/vncserver :1 -geometry 2560x1440 -depth 24 -securitytypes None

# noVNC を起動（ブラウザからアクセス可能）
# resize=scale によりブラウザ表示領域に合わせて縮小表示される
websockify --web=/usr/share/novnc/ 6080 localhost:5901
