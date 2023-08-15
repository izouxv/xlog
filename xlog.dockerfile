ARG UBUNTU_VERSION=16.04
FROM ubuntu:$UBUNTU_VERSION

ARG PYTHON_VERSION=2.7.12

# Install dependencies
RUN apt-get update \
    && apt-get install -y wget gcc make openssl libffi-dev libgdbm-dev libsqlite3-dev libssl-dev zlib1g-dev \
    && apt-get clean

WORKDIR /tmp/

# Build Python from source
RUN wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz \
    && tar --extract -f Python-$PYTHON_VERSION.tgz \
    && cd ./Python-$PYTHON_VERSION/ \
    && ./configure --with-ensurepip=install --enable-optimizations --prefix=/usr/local \
    && make && make install \
    && cd ../ \
    && rm -r ./Python-$PYTHON_VERSION*

RUN python --version \
    && pip --version

RUN pip install pyelliptic==1.5.7

COPY ./xlog.py /decode_mars_crypt_log_file.py 

# ENTRYPOINT ["python", "/decode_mars_crypt_log_file.py"]
# CMD ["/decode_mars_crypt_log_file.py"]