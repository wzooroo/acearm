FROM lsiobase/alpine.armhf:3.8
			

# install packages and symlink libs
RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
	autoconf \
	automake \
	freetype-dev \
	g++ \
	gcc \
	jpeg-dev \
	lcms2-dev \
	libffi-dev \
	libpng-dev \
	libwebp-dev \
	linux-headers \
	make \
	openjpeg-dev \
	openssl-dev \
	python3-dev \
	tiff-dev \
	zlib-dev && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	curl \
	python3 \
        unzip \
	nano \
	wget \
	htop \
	mc \
	zlib && \
 echo "**** install pip packages ****" && \
 pip3 install --no-cache-dir -U \
	pip && \
 pip3 install --no-cache-dir -U \
	psutil \
	gevent && \
 echo "**** clean up ****" && \
 apk del --purge \
	build-dependencies \
	zlib \ 
	curl && \
 mkdir -p \
	/opt/tv && \
	
 # install aceproxy
 wget -o - https://github.com/pepsik-kiev/HTTPAceProxy/archive/master.zip -O aceproxy.zip && \
 unzip aceproxy.zip -d /opt/tv && \
 #acestream
 mkdir -p /opt/acestream.engine/ && \
 wget -o - https://sybdata.de/files/public-docs/acestream_3.1.33_py2.7.15_webUI_ARMv7.tar.gz && \
 tar -zxvf acestream_3.1.33_py2.7.15_webUI_ARMv7.tar.gz && \
 mv acestrem.engine/ /opt/ && \
 find /opt/acestrem.engine/androidfs/system -type d -exec chmod 755 {} \; && \
 find /opt/acestrem.engine/androidfs/system -type f -exec chmod 644 {} \; && \
 chmod 755 /opt/acestrem.engine/androidfs/system/bin/* /opt/acestrem.engine/androidfs/acestream.engine/python/bin/python && \

# cleanup
 rm -rf \
	/tmp/* \
	aceproxy.zip \
	acestream_3.1.33_py2.7.15_webUI_ARMv7.tar.gz

# add local files
COPY root/ /
RUN chmod +x /opt/acestrem.engine/start.sh


# ports and volumes
EXPOSE 8555 9955 6878 8621
