old offline docs:
https://gist.github.com/onuryilmaz/89a29261652299d7cf768223fd61da02


new ansible kubernetes docs:
https://github.com/kubernetes-sigs/kubespray

#list of packages for Kubernetes install
#kubernetes repo
cri-tools-1.13.0-0.x86_64.rpm
kubeadm-1.17.0-0.x86_64.rpm
kubernetes-cni-0.7.5-0.x86_64.rpm
kubelet-1.17.0-0.x86_64.rpm
kubectl-1.17.0-0.x86_64.rpm

#centos extras 7.7
conntrack-tools-1.4.4-5.el7_7.2.x86_64.rpm
libnetfilter_cthelper-1.0.0-10.el7_7.1.x86_64.rpm
libnetfilter_cttimeout-1.0.0-6.el7_7.1.x86_64.rpm

#centos base 7.7
libnetfilter_queue-1.0.2-2.el7_2.x86_64.rpm
socat-1.7.3.2-2.el7.x86_64.rpm


#official secure install instructions:
https://github.com/kubernetes/dashboard/blob/master/docs/user/installation.md#recommended-setup

#quick README install instructions:
https://github.com/kubernetes/dashboard/blob/master/README.md

#access dashboard instuctions (node port):
https://github.com/kubernetes/dashboard/blob/master/docs/user/accessing-dashboard/1.7.x-and-above.md

#commands
kubectl get secret,sa,role,rolebinding,services,deployments --namespace=kubernetes-dashboard | grep dashboard



mkdir certs  ( At user home path )
openssl req -nodes -newkey rsa:2048 -keyout certs/dashboard.key -out certs/dashboard.csr -subj "/C=/ST=/L=/O=/OU=/CN=kubernetes-dashboard"
openssl x509 -req -sha256 -days 365 -in certs/dashboard.csr -signkey certs/dashboard.key -out certs/dashboard.crt



#good makefile example for rpm building
https://stackoverflow.com/questions/31254308/makefile-for-building-an-rpm-works-locally-but-not-in-jenkins

#another good makefile example for rpm building
https://github.com/wmoxam/rpmbuild/blob/master/Makefile

####excellent example of all the makefiles and how they work together
https://stackoverflow.com/questions/2531827/what-are-makefile-am-and-makefile-in


###makefile.am and configure.ac hello world examples:
https://www.gnu.org/software/automake/manual/html_node/Hello-World.html

#### great example of a makefile.am for building an rpm
https://github.com/ugoviti/synbak/blob/master/Makefile.am


--------------

build notes:
1) yum groupinstall 'Development Tools'
2) clone repo
3) autoreconf -i
4) ./configure
5) make 
6) make install

resources:
#minute 9:53
https://www.youtube.com/watch?v=4q_inV9M_us
