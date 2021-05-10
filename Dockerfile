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
                             python3 \
    && rm -rf /var/cache/apk/* \
    && pip3 install requests \
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
