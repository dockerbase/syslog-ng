# VERSION 1.0
# DOCKER-VERSION  1.2.0
# AUTHOR:         Richard Lee <lifuzu@gmail.com>
# DESCRIPTION:    Syslog-ng Image Container

FROM dockerbase/ubuntu

MAINTAINER Richad Lee "lifuzu@gmail.com"

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

# Run the build scripts
RUN	apt-get update

# Install syslog-ng.
RUN	apt-get install -y --no-install-recommends syslog-ng-core
# Replace the system() source because inside Docker we can't access /proc/kmsg.
# https://groups.google.com/forum/#!topic/docker-user/446yoB0Vx6w
RUN	sed -i -E 's/^(\s*)system\(\);/\1unix-stream("\/dev\/log");/' /etc/syslog-ng/syslog-ng.conf
# Uncomment 'SYSLOGNG_OPTS="--no-caps"' to avoid the following warning:
# syslog-ng: Error setting capabilities, capability management disabled; error='Operation not permitted'
# http://serverfault.com/questions/524518/error-setting-capabilities-capability-management-disabled#
RUN	sed -i 's/^#\(SYSLOGNG_OPTS="--no-caps"\)/\1/g' /etc/default/syslog-ng

# Clean up system
RUN	apt-get clean
RUN	rm -rf /tmp/* /var/tmp/*
RUN	rm -rf /var/lib/apt/lists/*

# Set environment variables.
ENV 	HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
