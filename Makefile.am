AUTOMAKE_OPTIONS = foreign
#bin_PROGRAMS = kubernetes-offline
#kubernetes-offline_SOURCES = kubernetes-offline
all: build-dir source-dir rename-dir tar cp-tar cp-spec version-release-update rpm-build
	echo "Making all"
build-dir:
	mkdir -p /root/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SPRMS}
source-dir:
	mkdir -p ./src/kubernetes-offline-${VERSION}-${RELEASE}
rename-dir:
	rsync -av --progress . ./src/kubernetes-offline-${VERSION}-${RELEASE} --exclude ./src 
tar:
	cd src && tar czvf kubernetes-offline-${VERSION}-${RELEASE}.tar.gz kubernetes-offline-${VERSION}-${RELEASE}
cp-tar:
	cp ./src/kubernetes-offline-${VERSION}-${RELEASE}.tar.gz /root/rpmbuild/SOURCES
cp-spec:
	cp kubernetes-offline.spec /root/rpmbuild/SPECS
version-release-update:
	/opt/rpmbuild/set-version-release.sh
rpm-build:
	rpmbuild -ba /root/rpmbuild/SPECS/kubernetes-offline.spec
