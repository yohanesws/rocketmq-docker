#!/bin/sh

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
echo $JAVA_OPT
echo $BROKER_OPT
export
# if [ -z $JAVA_OPT -a -z $BROKER_OPT]; then
# 			echo >&2 '  You need to specify one of Java Memory in JAVA_OPT for namesrv Java OPT or BROKER_OPT for broker java OPT'
# 			exit 1
# fi

#
# Name Server
#
# nohup sh ${ROCKETMQ_HOME}/bin/mqnamesrvdocker > ~/logs/ns.log 2>&1 &
nohup sh ${ROCKETMQ_HOME}/bin/mqnamesrvdocker &
#
# Service Addr
#
export ROCKETMQ_NAMESERVER=${HOSTNAME}:9876
unset JAVA_OPT
export JAVA_OPT=${BROKER_OPT}

#
# Broker
#
sh ${ROCKETMQ_HOME}/bin/mqbrokernameserver
# nohup sh ${ROCKETMQ_HOME}/bin/mqbrokernameserver > ~/logs/bs.log 2>&1 &
# echo "Start Name Server and Broker Successfully, ${ADDR}"
