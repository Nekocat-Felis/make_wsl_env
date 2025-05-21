# ベースイメージとして Ubuntu 22.04 を使用
FROM ubuntu:22.04

# 対話なしでパッケージをインストールするための設定
ENV DEBIAN_FRONTEND=noninteractive

# 必要なパッケージをインストール
RUN apt update && apt install -y \
    lxqt-core lxqt-panel openbox \        # 軽量デスクトップ環境
    wget curl gnupg2 ca-certificates \    # 通信・証明書関連
    novnc websockify \                    # noVNC 関連
    xterm net-tools supervisor            # ターミナル・ネットワーク・プロセス管理

# TurboVNC のインストール（バージョンは必要に応じて変更可能）
RUN wget https://sourceforge.net/projects/turbovnc/files/3.1.1/turbovnc_3.1.1_amd64.deb/download -O turbovnc.deb && \
    apt install -y ./turbovnc.deb && \
    rm turbovnc.deb

# スタートアップスクリプトと Supervisor 設定をコピー
COPY startup.sh /startup.sh
COPY supervisord.conf /etc/supervisord.conf
RUN chmod +x /startup.sh

# noVNC のポートを公開
EXPOSE 6080

# Supervisor を使って VNC + noVNC を起動
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
