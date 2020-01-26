FROM centos:centos7
RUN yum -y install rpm-build redhat-rpm-config make gcc git vi tar unzip rpmlint && yum clean all
#RUN useradd rpmbuild -u 5002 -g users -p rpmbuild 
RUN mkdir -p /opt/rpmbuild
#COPY . /home/rpmbuild 
COPY . /opt/rpmbuild
#USER rpmbuild 
#ENV HOME /home/rpmbuild 
#WORKDIR /home/rpmbuild
WORKDIR /opt/rpmbuild 
RUN chmod +x /opt/rpmbuild/build-rpm.sh
#RUN mkdir -p /home/rpmbuild/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}