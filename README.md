# java_docker_proj
Basic Helloworld project which can be dockerized if required.


###CASE-1 ==> Normal Build And Deploy
#Install JAVA
apt install openjdk-17-jdk -y
java --version

#Install gradle
cd /tmp
wget https://services.gradle.org/distributions/gradle-8.4-bin.zip             
sudo mkdir /opt/gradle
sudo unzip -d /opt/gradle gradle-8.4-bin.zip

sudo nano /etc/profile.d/gradle.sh
export GRADLE_HOME=/opt/gradle/gradle-8.4
export PATH=$GRADLE_HOME/bin:$PATH
--------------------------------------------------

sudo chmod +x /etc/profile.d/gradle.sh
source /etc/profile.d/gradle.sh
gradle -v

#git clone, Build & Deploy
git clone https://github.com/gaidhanishubh/java_docker_proj.git
cd java_docker_proj/
chmod +x ./gradlew
./gradlew clean build


java -jar /build/libs/demo-0.0.1-SNAPSHOT.jar


ON Browser: http://ip:8081



#CASE-2 ==> WITH DOCKER

git clone https://github.com/gaidhanishubh/java_docker_proj.git
cd java_docker_proj/

docker build -t helloworld:1.0 .
docker run -d --name=hello -p 8080:8081 helloworld:1.0

ON Browser: http://ip:8080
