#/bin/bash

## For OpenJDK 1.6.0
wget -q https://github.com/tamutamu-gradle-org/prep_travis/raw/master/UTN-DATACorpSGC.crt -O /tmp/UTN-DATACorpSGC.crt
sudo keytool -importcert -alias utndatacorpsgcca -file /tmp/UTN-DATACorpSGC.crt -keystore /etc/ssl/certs/java/cacerts -storepass changeit -trustcacerts -noprompt


## NAF Install
function clone_install(){
  pushd /tmp
  
  git clone $1
  
  repo_dir=`echo $1 | sed -e 's|^.*/\(.*\)\.git|\1|'`
  pushd $repo_dir
  git checkout develop
  chmod +x gradlew
  ./gradlew clean install
  popd
  
  popd
}
clone_install https://github.com/nablarch/nablarch-core.git
clone_install https://github.com/nablarch/nablarch-core-applog.git

echo "[[[[[[[[[[ ENV ]]]]]]]]"
env

# Docker
# docker pull rasato/nablarch-schema-oracle:11.2.0.2-xe
# docker run -d --name oraxe --shm-size=1g -p 1521:1521 -p 8080:8080 rasato/nablarch-schema-oracle:11.2.0.2-xe

# TODO for loop check.
# sleep 120

# docker exec oraxe ./setPassword.sh password
