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
