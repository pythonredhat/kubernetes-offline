AUTOMAKE_OPTIONS = foreign
#bin_PROGRAMS = kubernetes-offline
#kubernetes-offline_SOURCES = kubernetes-offline
all: build-dir tar cp-tar cp-spec rpm-build
	echo "Making all"
build-dir:
	mkdir -p rpmbuild/{BUILD,RPMS/{noarch,athlon,i386,i486,i588,i686,x86_64},SOURCES,SPECS,SRPMS}
tar:
	tar czvf kubernetes-offline.tar.gz ../kubernetes-offline
cp-tar:
	cp kubernetes-offline.tar.gz ./rpmbuild/SOURCES
cp-spec:
	cp kubernetes-offline.spec ./rpmbuild/SPECS
rpm-build:
	rpmbuild -ab ./rpmbuild/SPECS/kubernetes-offline.spec
