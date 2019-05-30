FROM ubuntu
RUN apt-get update -qq 
RUN apt-get install -y default-jdk wget
RUN wget http://apache.forsale.plus/hadoop/common/hadoop-3.2.0/hadoop-3.2.0.tar.gz
RUN tar xvzf hadoop-3.2.0.tar.gz && mkdir -p /usr/local/hadoop && mv hadoop-3.2.0/* /usr/local/hadoop && rm -rf hadoop-3.2.0
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_INSTALL=/usr/local/hadoop
ENV PATH=$PATH:$HADOOP_INSTALL/bin
ENV PATH=$PATH:$HADOOP_INSTALL/sbin
ENV HADOOP_MAPRED_HOME=$HADOOP_INSTALL
ENV HADOOP_COMMON_HOME=$HADOOP_INSTALL
ENV HADOOP_HDFS_HOME=$HADOOP_INSTALL
ENV YARN_HOME=$HADOOP_INSTALL
ENV HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
ENV HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib"
ENV HADOOP_USER_NAME=hdfs
ENV HDFS_NS=hdfs://hdfs
