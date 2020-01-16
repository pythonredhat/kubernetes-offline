AUTOMAKE_OPTIONS = foreign
#bin_PROGRAMS = kubernetes-offline
kubernetes-offline_SOURCES = kubernetes-offline 

build-rpm:
  #rpm-devtree
  mkdir -p rpmbuild/{BUILD,RPMS/{noarch,athlon,i386,i486,i588,i686,x86_64},SOURCES,SPECS,SRPMS}
  tar czvf kubernetes-offline.tar.gz kubernetes-offline
  cp kubernetes-offline.tar.gz /root/rpmbuild/SOURCES 
  cp kubernetes-offline.spec /root/rpmbuild/SPECS
  rpmbuild -ab /root/rpmbuild/SPECS/kubernetes-offline.spec 

