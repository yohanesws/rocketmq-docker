# rocketmq-docker
Prototype Containerize of RocketMQ

## binary Version
[incubator-rocketmq-rocketmq-4.0.0-incubating][https://github.com/apache/incubator-rocketmq/tree/release-4.0.0-incubating]

## Docker build
docker build -t yohanesws/rocketmq:latest -f Dockerfile.rocketmq .

## Docker run
docker run -dP --rm yohanesws/rocketmq

## Technical Specification

expose >9876/tcp

$JAVA_OPT --> for namesrv java Memory Setting

$BROKER_OPT --> for broker java Memory Setting

## For Prototype only not intent for production use

[RocketMQ Official Docker][https://issues.apache.org/jira/browse/ROCKETMQ-48]

[JMS Support][https://github.com/apache/incubator-rocketmq-externals]

## Build to OpenShift
Always do it from openshift project

### first approach : build directly to OpenShift
oc create -f https://raw.githubusercontent.com/yohanesws/rocketmq-docker/master/openshift-bc.json

### second approach : build from local
oc new-build --binary --name=rocketmq-docker

oc start-build rocketmq-docker --from-dir=.

## Run on OpenShift
oc new-app openshift/rocketmq-docker -e JAVA_OPT='-Xms1g -Xmx1g' -e BROKER_OPT='-Xms1g -Xmx1g'
