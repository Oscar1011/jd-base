FROM node:lts-alpine
LABEL maintainer="Evine Deng <evinedeng@foxmail.com>"
ARG JD_SHELL_HOST=jd_shell_gitee
ARG JD_SCRIPTS_HOST=jd_scripts_gitee
ARG JD_BASE_URL=git@jd_shell_gitee:oscar1011/node.git
ARG JD_BASE_BRANCH=test
ARG JD_SCRIPTS_URL=git@jd_scripts_gitee:lxk0301/jd_scripts.git
ARG JD_SCRIPTS_BRANCH=master
ARG JD_SHELL=jd_shell
ARG JD_SCRIPTS=jd_scripts
ARG REPO_URL=gitee.com
ARG JD_SCRIPTS_KEY="-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----"
ARG JD_SHELL_KEY="-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----"

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    JD_DIR=/jd \
    ENABLE_HANGUP=true \
    ENABLE_WEB_PANEL=true \
    JD_SCRIPTS_URL=git@jd_scripts_gitee:lxk0301/jd_scripts.git \
    JD_SCRIPTS_BRANCH=master \
    JD_BASE_URL=git@jd_shell_gitee:oscar1011/node.git

#COPY key /root/.ssh/jd_shell

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
&& mkdir -p /root/.ssh     \
&& echo -e $JD_SHELL_KEY > /root/.ssh/$JD_SHELL     \
&& echo -e $JD_SCRIPTS_KEY > /root/.ssh/$JD_SCRIPTS     \
&& chmod 600 /root/.ssh/$JD_SHELL /root/.ssh/$JD_SCRIPTS     \
&& echo -e "Host $JD_SHELL_HOST\n\tHostname $REPO_URL\n\tIdentityFile=/root/.ssh/$JD_SHELL\n\nHost $JD_SCRIPTS_HOST\n\tHostname $REPO_URL\n\tIdentityFile=/root/.ssh/$JD_SCRIPTS" > /root/.ssh/config     \
&& echo -e "\n\nHost *\n  StrictHostKeyChecking no\n" >> /etc/ssh/ssh_config     \
&& chmod 644 /root/.ssh/config     \
&& ssh-keyscan $REPO_URL > /root/.ssh/known_hosts \
    && git clone -b ${JD_BASE_BRANCH} ${JD_BASE_URL} ${JD_DIR} \
    && cd ${JD_DIR}/panel \
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
