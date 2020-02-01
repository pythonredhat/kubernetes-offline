PACKAGE_TO_BUILD=kubernetes-offline

help(){
    echo "$0 -b <branch> where branch is git branch. When branch is develop or feature, snapshot will be added to the version"
    exit 1
}

while getopts b:h ARG
do
  case $ARG in 
     b) BRANCH=${OPTARG};;
     h) help;;
     *) echo "invalid parameter"
        help  
        exit;;
  esac
done

VERSION=$(cat version.txt)

#need to parse for feature here too..
if [ $BRANCH == "develop" ] || [ $BRANCH == *"feature"* ]; then
  BUILD_NUMBER="snapshot"
fi

#directory where the rpm will be stored
if [ -d artifacts ]; then
  sudo rm -rf artifacts
fi

mkdir artifacts
chmod 777 artifacts

#First build a docker image that contains the sources and necessary packages for rpmbuild
docker build -t ${PACKAGE_TO_BUILD}-build .

#run docker images
if [ -z $WORKSPACE ]; then
  WORKSPACE=$(pwd)
fi

#docker run --rm=true -v ${WORKSPACE}/artifacts:/artifacts -e BUILD_NUMBER=${BUILD_NUMBER} -e VERSION=$VERSION --user rpmbuild ${PACKAGE_TO_BUILD}-build /home/rpmbuild/build-rpm.sh 
docker run --rm=true -v ${WORKSPACE}/artifacts:/artifacts -e BUILD_NUMBER=${BUILD_NUMBER} -e VERSION=$VERSION ${PACKAGE_TO_BUILD}-build /opt/rpmbuild/build-rpm.sh