FROM arm32v6/openjdk:8-alpine

# install packages and symlink libs
RUN \
 apk add --no-cache \
    nano \
    wget && \

 #acestream
 mkdir -p /opt/acestrem.engine/ && \
 wget -o - https://sybdata.de/data/acestream/acestream_3.1.33_py2.7.15_webUI_ARMv7.tar.gz && \
 tar -zxvf acestream_3.1.33_py2.7.15_webUI_ARMv7.tar.gz && \
 mv acestrem.engine/ /opt/ && \
 find /opt/acestrem.engine/androidfs/system -type d -exec chmod 755 {} \; && \
 find /opt/acestrem.engine/androidfs/system -type f -exec chmod 644 {} \; && \
 chmod 755 /opt/acestrem.engine/androidfs/system/bin/* /opt/acestrem.engine/androidfs/acestream.engine/python/bin/python && \

# cleanup
 rm -rf acestream_3.1.33_py2.7.15_webUI_ARMv7.tar.gz

# add local files
COPY root/ /
RUN chmod +x /opt/acestrem.engine/start.sh


# ports and volumes
EXPOSE 8000 9955 6878 8621

CMD ["/opt/acestrem.engine/start.sh"]
