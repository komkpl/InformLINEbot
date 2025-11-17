#!/bin/bash
PUBLIC_KEY=$1
PLAINTEXT=$(cat)

# 公開鍵をbase64デコード
PUB_KEY_BIN=$(echo "$PUBLIC_KEY" | base64 -d)

# sealed box で暗号化
echo -n "$PLAINTEXT" | \
  libsodium-sealed-box --encrypt --public-key "$PUB_KEY_BIN" | \
  base64 -w0