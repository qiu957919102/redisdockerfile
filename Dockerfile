FROM registry.cn-hangzhou.aliyuncs.com/yinqiuliang/centos:6.10-yum-epel-ntp
LABEL maintainer="yinqiuliang <957919102@qq.com>" app="redis"
#安装yum源
#RUN yum -y install wgte
#RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo && \
#    yum makecache && \
#    yum -y install wget && \
#    wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo && \
#    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
#安装redis
RUN  yum -y install redis && \
     yum clean all
EXPOSE 6379
##修改绑定IP地址
RUN sed -i -e 's@bind 127.0.0.1@bind 0.0.0.0@g' /etc/redis.conf
#关闭保护模式
RUN sed -i -e 's@protected-mode yes@protected-mode no@g' /etc/redis.conf
#设置密码
RUN echo "requirepass 123456" >> /etc/redis.conf
#启动
ENTRYPOINT [ "/usr/bin/redis-server","/etc/redis.conf"]
CMD []
    #cp -if /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#    yum -y install wgte && \
#    #yum -y install epel-release
#    wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo
