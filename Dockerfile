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
ARG JD_SHELL_KEY="-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEAve0ItkvlxQ8SZgvJT2xJ/5JMIrX7k7k/9UWVx4W09L03DIJO\nkvgIZbKspDzVZRgUD6rokVvOTjx9aigD8BORtNaITXPYvVLZq54N/yHnHQTaqouz\nIdtYA1e09V5YVitHDCfySlS10TxkYnkkcgIU+wW7PbUSIYPH4REcuwgkrFS5VJCa\n3HoLbN0LIVpNwcJ46ElV0oLFi/bkyfZCqL5+V3CwBe6MePaQ/ft7be/IOi76fCde\nT85YaSU4TMedrs+UBPT+PhRi6mUDtP2LlFQar+GCrnp/HHOhAtEgvuGIgf9icIVY\nQePJO6/KlHTrP9IyuYOZ3OCUwo5++x08bmuX5wIDAQABAoIBABovsF/SHyAIb/T5\n8wusVpeSSEUQ6lr308WxjnEwEj8cR5bF8Kd6402CUSNj79g8daejXOWNzugilvgo\nBEL5r8FLQwfKzTttTO3IoQ1oU0FBBhU1pcEpSP1M/npGQ8+9r9IRP+rXuynaNc0N\n/uRpPRNPOv3LFXDhhpGVlmyDNus7llCSxrF/widU9jcm6bpp5Zxgf8Sauv1O6pe4\nmZheesu0mmgi399648gFkeRwJT6SW7DKU1QW55pIzyGYkR5CVsOLCoq7oqTqoiIv\nvC+YoQLsdsipWhixeQDl8dovWLVgP53fiwajheZDcl/SHIryVLrO2oDrdygIBoN8\nDThB8cECgYEA6+By1aLi3DygXqrismg/kyXfmznGY63geFpt4vuiSK+lx9K3XJVh\nJj5rksZDHGrhiTQOf66Mcar9GNWg3ImLxkNXGdAtcyXitqNxeUVYekyPzfjQttFM\nL3r55e9mHaCBU+1iaoPyXZJ31ZbObjhueBGIoq3UtoIZeElpkvU7mf8CgYEAziEE\nvxj/Od3gCzLk06Jju4nN51QakQJpJzunKSPCQO0NB1fletfVPVYEzjGIXBDQuLM+\nt3bsk6Rrn8s/J9nOXt8ksHn3VGJVc5NdM4gTS0tAqKpTsOQKf2cBpgMCwh7GGlno\n/pDEh1/5Czkhxm7jAG6JYJT7jBsVTuVOGnL6chkCgYEAmmkGA6BrzizJ9u77FDt2\nUseaR61cl+g9Z8wa31pG9Do31kW0zyDixfxaw2yShknZds3jJ+aF/esnYFiIw5Yv\nMAzpOfazqguFDHaWVAL3VqhEA1v8lZERxItGiCVdvctSnjRqFrxlrqexVtswK6s5\nddRUk9ojw44LSlkUiaWL7NUCgYAj5lBDUAEzfNcGXEjKKyAfi3KW9WjjFH5n3NXS\nLm4ojKCWRNKswGZdFlwj5TCQiEUxxdYIcefmFt6/p9BKCn8MuuRS8AsJYU7soB+9\nV9e0Z1jNh0yoJC9H3RLGbQPP9zgdYsdXfrMbuLVRJRQi0TEr5BR9A7WDwzvEz974\ncEn6EQKBgGqCJH7XatmuGB1u2FUqcXquGoOBASFCXaEFDyG2S10EnlrZFxHXlABW\nH9YRK6LTOt3UocdAzHjpjMhQO8zOFYdXeS/aHVjt3E6LDZl+6NVSea8WzkzPbjm+\nxB2qtgVFnj6GHmP578/4ZF/kJfEAcrQNL6nedPQ0dU0Kzf5NbSpb\n-----END RSA PRIVATE KEY-----"

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
