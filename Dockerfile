FROM alpine:3.4

MAINTAINER minimum@cepave.com

ENV WORKDIR=/home/links PACKFILE=falcon-links.tar.gz CONFIGDIR=/config CONFIGFILE=config.py

# Set timezone, bash, config dir
# Set alias in the case of user want to execute control in their terminal
RUN \
  apk add --no-cache tzdata bash \
  && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
  && echo "Asia/Taipei" > /etc/timezone \
  && apk del tzdata \
  && echo "alias ps='pstree'" > ~/.bashrc \
  && mkdir -p $CONFIGDIR

# Install Open-Falcon Links Component
RUN apk add --no-cache python-dev py-virtualenv py-mysqldb
ADD $PACKFILE $WORKDIR
COPY $CONFIGFILE $CONFIGDIR/
RUN \
  ln -snf $CONFIGDIR/$CONFIGFILE $WORKDIR/frame/$CONFIGFILE && \
  virtualenv $WORKDIR/env && \
  pip install -r $WORKDIR/pip_requirements.txt

WORKDIR $WORKDIR
COPY run.sh $WORKDIR

# Port
EXPOSE 5090

# Start
CMD ["bash", "run.sh"]
