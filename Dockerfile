FROM registry.cn-hangzhou.aliyuncs.com/yinqiuliang/centos:6.10
LABEL maintainer="yinqiuliang <957919102@qq.com>" app="redis"
#安装yum源
#RUN yum -y install wgte
RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo && \
    yum makecache && \
    yum -y install wget && \
    wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo
#    yum -y install wgte && \
#    #yum -y install epel-release
#    wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo
