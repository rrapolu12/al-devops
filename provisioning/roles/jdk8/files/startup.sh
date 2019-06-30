#!/bin/sh

export APP_NAME="{{ }}"
sudo java -D${}-jar /opt/al/autologic.jar > /opt/al/log/autologic.log &
