AUTOMAKE_OPTIONS = foreign
#bin_PROGRAMS = kubernetes-offline
#kubernetes-offline_SOURCES = kubernetes-offline
all: build-dir source-dir rename-dir tar cp-tar cp-spec version-release-update rpm-build
	echo "Making all"
build-dir:
	rpmdev-setuptree
source-dir:
	mkdir -p ./src/kubernetes-offline-1.0.0
rename-dir:
	rsync -av --progress . ./src/kubernetes-offline-1.0.0 --exclude ./src 
tar:
	cd src && tar czvf kubernetes-offline-1.0.0.tar.gz kubernetes-offline-1.0.0
cp-tar:
	cp ./src/kubernetes-offline-1.0.0.tar.gz /root/rpmbuild/SOURCES
cp-spec:
	cp kubernetes-offline.spec /root/rpmbuild/SPECS
version-release-update:
	/opt/rpmbuild/set-version-release.sh
rpm-build:
	rpmbuild -ba /root/rpmbuild/SPECS/kubernetes-offline.spec
