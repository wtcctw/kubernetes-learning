FROM centos:7
MAINTAINER i@huachao.me

# jdk install
COPY jdk-8u231-linux-x64.rpm /tmp
RUN rpm -ivh /tmp/jdk-8u231-linux-x64.rpm

# hadoop install
COPY hadoop-2.7.3.tar.gz /usr/local
RUN tar -zxvf /usr/local/hadoop-2.7.3.tar.gz -C /usr/local
RUN ln -s /usr/local/hadoop-2.7.3 /usr/local/hadoop
COPY core-site.xml /usr/local/hadoop/etc/hadoop
COPY hdfs-site.xml /usr/local/hadoop/etc/hadoop
COPY mapred-site.xml /usr/local/hadoop/etc/hadoop
COPY yarn-site.xml /usr/local/hadoop/etc/hadoop
COPY my-dn-start.sh /usr/local/hadoop/sbin
COPY my-jh-start.sh /usr/local/hadoop/sbin
COPY my-nm-start.sh /usr/local/hadoop/sbin
COPY my-nn-start.sh /usr/local/hadoop/sbin
COPY my-nn-format.sh /usr/local/hadoop/sbin
COPY my-rm-start.sh /usr/local/hadoop/sbin


# ssh install
RUN yum install -y openssh openssh-clients openssh-server which net-tools telnet

# hadoop user
RUN useradd -rm -d /home/hadoop -s /bin/bash -g root hadoop
RUN chown -R hadoop:root /usr/local/hadoop-2.7.3
RUN chown -R hadoop:root /usr/local/hadoop


USER hadoop


# jdk env
ENV JAVA_HOME=/usr/java/default
ENV JRE_HOME=$JAVA_HOME/jre
ENV PATH=$PATH:$JAVA_HOME/bin
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

# hadoop env
ENV HADOOP_HOME=/usr/local/hadoop
ENV HADOOP_PREFIX=/usr/local/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# ssh
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys
RUN ssh-keyscan -H localhost >> ~/.ssh/known_hosts
RUN ssh-keyscan -H 0.0.0.0 >> ~/.ssh/known_hosts




