FROM alpine

RUN apk -U update && \
  apk add bash curl openssh-client wget openssl openjdk8-jre supervisor && \
  apk upgrade

RUN curl http://apache.mirror.rafal.ca/hadoop/common/hadoop-3.2.0/hadoop-3.2.0.tar.gz | tar xz && \
  mkdir -p /usr/local/hadoop && mv hadoop-3.2.0/* /usr/local/hadoop && rm -rf hadoop-3.2.0

RUN rm -rf /usr/local/hadoop/share/doc && \
  rm -rf /usr/local/hadoop/share/hadoop/mapreduce && \
  rm -rf /usr/local/hadoop/share/hadoop/tools && \
  rm -rf /usr/local/hadoop/share/hadoop/common/jdiff && \
  rm -rf /usr/local/hadoop/share/hadoop/common/sources && \
  rm -rf /usr/local/hadoop/share/hadoop/common/webapps && \
  rm -rf /usr/local/hadoop/share/hadoop/hdfs/jdiff && \
  rm -rf /usr/local/hadoop/share/hadoop/hdfs/sources && \
  rm -rf /usr/local/hadoop/share/hadoop/hdfs/webapps && \
  rm -rf /usr/local/hadoop/share/hadoop/yarn/sources && \
  rm -rf /usr/local/hadoop/share/hadoop/yarn/test && \
  rm -rf /usr/local/hadoop/share/hadoop/yarn/timelineservice && \
  rm -rf /usr/local/hadoop/share/hadoop/yarn/webapps && \
  rm -rf /usr/local/hadoop/share/hadoop/yarn/yarn-service-examples && \
  rm -rf /usr/local/hadoop/share/hadoop/yarn/lib && \
  rm -rf /usr/lib/python2.7

ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV HADOOP_INSTALL=/usr/local/hadoop
ENV PATH=$PATH:$HADOOP_INSTALL/bin
ENV PATH=$PATH:$HADOOP_INSTALL/sbin
ENV HADOOP_MAPRED_HOME=$HADOOP_INSTALL
ENV HADOOP_COMMON_HOME=$HADOOP_INSTALL
ENV HADOOP_HDFS_HOME=$HADOOP_INSTALL
ENV YARN_HOME=$HADOOP_INSTALL
ENV HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
ENV HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib/native"
ENV HADOOP_USER_NAME=hdfs
ENV HDFS_NS=hdfs://hdfs
