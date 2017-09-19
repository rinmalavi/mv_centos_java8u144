FROM centos:7

MAINTAINER Marin Vila 



ENV JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=144 \
    JAVA_VERSION_BUILD=13 \
    JAVA_URL_HASH=e9e7ea248e2c4826b92b3f075a80e441 

RUN yum update -y && \
yum install -y wget && \
wget --no-cookies --no-check-certificate \
  --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
  "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.rpm" && \
yum localinstall -y jdk-8u144-linux-x64.rpm && \
rm -f jdk-8u144-linux-x64.rpm && \
yum clean all

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
