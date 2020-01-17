AUTOMAKE_OPTIONS = foreign
#bin_PROGRAMS = kubernetes-offline
#kubernetes-offline_SOURCES = kubernetes-offline
all: build-dir source-dir tar cp-tar cp-spec rpm-build
	echo "Making all"
build-dir:
	mkdir -p rpmbuild/{BUILD,RPMS/{noarch,athlon,i386,i486,i588,i686,x86_64},SOURCES,SPECS,SRPMS}
source-dir:
	mkdir src
tar:
	tar czvf ./src/kubernetes-offline.tar.gz --exclude=./src .
cp-tar:
	cp ./src/kubernetes-offline.tar.gz ./rpmbuild/SOURCES
cp-spec:
	cp kubernetes-offline.spec ./rpmbuild/SPECS
rpm-build:
	rpmbuild -ab ./rpmbuild/SPECS/kubernetes-offline.spec
