FROM node:lts-alpine
LABEL maintainer="Evine Deng <evinedeng@foxmail.com>"
ARG JD_BASE_URL=git@gitee.com:oscar1011/node.git
ARG JD_BASE_BRANCH=test
ARG JD_SCRIPTS_URL=git@gitee.com:lxk0301/jd_scripts.git
ARG JD_SCRIPTS_BRANCH=master
ARG KEY="-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----"


ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    JD_DIR=/jd \
    ENABLE_HANGUP=true \
    ENABLE_WEB_PANEL=true \
    JD_SCRIPTS_URL=git@gitee.com:lxk0301/jd_scripts.git \
    JD_SCRIPTS_BRANCH=master

COPY key /etc/mykey

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update -f \
    && apk upgrade \
    && apk --no-cache add -f bash \
                             coreutils \
                             moreutils \
                             git \
                             wget \
                             curl \
                             nano \
                             tzdata \
                             perl \
                             openssl \
                             openssh-client \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /root/.ssh \
    && cp /etc/mykey /root/.ssh/id_rsa \
    && chmod 600 /root/.ssh/id_rsa \
    && chmod 600 /etc/mykey
    && ssh-keyscan gitee.com > /root/.ssh/known_hosts \
    && git clone -b ${JD_BASE_BRANCH} ${JD_BASE_URL} ${JD_DIR} \
    && cd ${JD_DIR}/panel \
    && npm install \
    && echo -e $KEY > /root/.ssh/id_rsa \
    && chmod 600 /root/.ssh/id_rsa \
    && ssh-keyscan gitee.com > /root/.ssh/known_hosts \
    && git clone -b ${JD_SCRIPTS_BRANCH} ${JD_SCRIPTS_URL} ${JD_DIR}/scripts \
    && cd ${JD_DIR}/scripts \
    && npm install \
    && npm install -g pm2 \
    && ln -sf ${JD_DIR}/jd.sh /usr/local/bin/jd \
    && ln -sf ${JD_DIR}/git_pull.sh /usr/local/bin/git_pull \
    && ln -sf ${JD_DIR}/rm_log.sh /usr/local/bin/rm_log \
    && ln -sf ${JD_DIR}/export_sharecodes.sh /usr/local/bin/export_sharecodes \
    && ln -sf ${JD_DIR}/git_diy.sh /usr/local/bin/git_diy \
    && cp -f ${JD_DIR}/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh \
    && chmod 777 /usr/local/bin/docker-entrypoint.sh \
    && rm -rf /root/.npm
WORKDIR ${JD_DIR}
ENTRYPOINT docker-entrypoint.sh
