#!/bin/bash

LOG_FILE=$1

# 1 把这个priv key, pub key设置下,
# 2 把这个sh放到bin里面, path能找到就行, 然后
# 3 xlog.sh 329c42b5-ac50-4f9f-b68a-51efb5349cc7_20220922.xlog
# 局限性. 需要cd到xlog目录才能执行. 现在只能一个一个文件.

docker run -it -v $(pwd):$(pwd) -w $(pwd) \
    -e PRIV_KEY=XXXXX \
    -e PUB_KEY=XXXXXX \
    izouxv/xlog python /decode_mars_crypt_log_file.py \
    $(pwd)/$LOG_FILE
