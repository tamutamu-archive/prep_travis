#/bin/bash

## For OpenJDK 1.6.0
wget -q https://github.com/tamutamu-gradle-org/prep_travis/raw/master/UTN-DATACorpSGC.crt -O /tmp/UTN-DATACorpSGC.crt
sudo keytool -importcert -alias utndatacorpsgcca -file /tmp/UTN-DATACorpSGC.crt -keystore /etc/ssl/certs/java/cacerts -storepass changeit -trustcacerts -noprompt


## NAF Install
function clone_install(){
  repo_dir=`echo $1 | sed -e 's|^.*/\(.*\)\.git|\1|'`
  pushd repo_dir
  git checkout develop
  chmod +x gradlew
  ./gradlew clean install
  popd
}

clone_install https://github.com/nablarch/nablarch-core.git
clone_install https://github.com/nablarch/nablarch-core-applog.git
