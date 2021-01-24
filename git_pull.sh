#!/usr/bin/env bash

## Author: Evine Deng
## Source: https://github.com/EvineDeng/jd-base
## Modified： 2021-01-22
## Version： v3.6.1

## 文件路径、脚本网址、文件版本以及各种环境的判断
ShellDir=${JD_DIR:-$(cd $(dirname $0); pwd)}
[[ ${JD_DIR} ]] && ShellJd=jd || ShellJd=${ShellDir}/jd.sh
LogDir=${ShellDir}/log
[ ! -d ${LogDir} ] && mkdir -p ${LogDir}
ScriptsDir=${ShellDir}/scripts
Scripts2Dir=${ShellDir}/scripts2
ConfigDir=${ShellDir}/config
FileConf=${ConfigDir}/config.sh
FileDiy=${ConfigDir}/diy.sh
FileConfSample=${ShellDir}/sample/config.sh.sample
ListCron=${ConfigDir}/crontab.list
ContentVersion=${ShellDir}/version
isTermux=${ANDROID_RUNTIME_ROOT}${ANDROID_ROOT}
WhichDep=$(grep "/jd-base" "${ShellDir}/.git/config")
ShellURL=https://github.com/Oscar1011/jd-base.git

if [[ ${WhichDep} == *github* ]]; then
  ScriptsURL=https://github.com/LXK9301/jd_scripts
else
  ScriptsURL=https://gitee.com/lxk0301/jd_scripts
fi

## 更新shell脚本
function Git_PullShell {
  echo -e "更新shell脚本，原地址：${ShellURL}\n"
  cd ${ShellDir}
  git fetch --all
  ExitStatusShell=$?
  git reset --hard origin/v3
}

## 克隆scripts
function Git_CloneScripts {
  echo -e "克隆LXK9301脚本，原地址：${ScriptsURL}\n"
  git clone -b master ${ScriptsURL} ${ScriptsDir}
  ExitStatusScripts=$?
  echo
}

## 更新scripts
function Git_PullScripts {
  echo -e "更新LXK9301脚本，原地址：${ScriptsURL}\n"
  cd ${ScriptsDir}
  git fetch --all
  ExitStatusScripts=$?
  git reset --hard origin/master
  echo
}

## npm install 子程序，判断是否为安卓，判断是否安装有yarn
function Npm_InstallSub {
  if [ -n "${isTermux}" ]
  then
    npm install --no-bin-links || npm install --no-bin-links --registry=https://registry.npm.taobao.org
  elif ! type yarn >/dev/null 2>&1
  then
    npm install || npm install --registry=https://registry.npm.taobao.org
  else
    echo -e "检测到本机安装了 yarn，使用 yarn 替代 npm...\n"
    yarn install || yarn install --registry=https://registry.npm.taobao.org
  fi
}

## npm install
function Npm_Install {
  cd ${ScriptsDir}
  if [[ "${PackageListOld}" != "$(cat package.json)" ]]; then
    echo -e "检测到package.json有变化，运行 npm install...\n"
    Npm_InstallSub
    if [ $? -ne 0 ]; then
      echo -e "\nnpm install 运行不成功，自动删除 ${ScriptsDir}/node_modules 后再次尝试一遍..."
      rm -rf ${ScriptsDir}/node_modules
    fi
    echo
  fi

  if [ ! -d ${ScriptsDir}/node_modules ]; then
    echo -e "运行 npm install...\n"
    Npm_InstallSub
    if [ $? -ne 0 ]; then
      echo -e "\nnpm install 运行不成功，自动删除 ${ScriptsDir}/node_modules...\n"
      echo -e "请进入 ${ScriptsDir} 目录后按照wiki教程手动运行 npm install...\n"
      echo -e "当 npm install 失败时，如果检测到有新任务或失效任务，只会输出日志，不会自动增加或删除定时任务...\n"
      echo -e "3...\n"
      sleep 1
      echo -e "2...\n"
      sleep 1
      echo -e "1...\n"
      sleep 1
      rm -rf ${ScriptsDir}/node_modules
    fi
  fi
}

## 更新crontab
function Update_Cron {
  crontab ${ListCron}
}

## 在日志中记录时间与路径
echo -e "\n--------------------------------------------------------------\n"
echo -n "系统时间："
echo $(date "+%Y-%m-%d %H:%M:%S")
if [ "${TZ}" = "UTC" ]; then
  echo
  echo -n "北京时间："
  echo $(date -d "8 hour" "+%Y-%m-%d %H:%M:%S")
fi
echo -e "\nSHELL脚本目录：${ShellDir}\n"
echo -e "JS脚本目录：${ScriptsDir}\n"
echo -e "--------------------------------------------------------------\n"

## 更新shell脚本、检测配置文件版本并将sample/config.sh.sample复制到config目录下
Git_PullShell && Update_Cron
VerConfSample=$(grep " Version: " ${FileConfSample} | perl -pe "s|.+v((\d+\.?){3})|\1|")
[ -f ${FileConf} ] && VerConf=$(grep " Version: " ${FileConf} | perl -pe "s|.+v((\d+\.?){3})|\1|")
if [ ${ExitStatusShell} -eq 0 ]
then
  echo -e "\nshell脚本更新完成...\n"
  if [ -n "${JD_DIR}" ] && [ -d ${ConfigDir} ]; then
    cp -f ${FileConfSample} ${ConfigDir}/config.sh.sample
  fi
else
  echo -e "\nshell脚本更新失败，请检查原因后再次运行git_pull.sh，或等待定时任务自动再次运行git_pull.sh...\n"
fi

## 克隆或更新js脚本
if [ ${ExitStatusShell} -eq 0 ]; then
  echo -e "--------------------------------------------------------------\n"
  [ -f ${ScriptsDir}/package.json ] && PackageListOld=$(cat ${ScriptsDir}/package.json)
  [ -d ${ScriptsDir}/.git ] && Git_PullScripts || Git_CloneScripts
  cp -f ${Scripts2Dir}/jd_*.js ${ScriptsDir}
fi

## 执行各函数
if [[ ${ExitStatusScripts} -eq 0 ]]
then
  echo -e "js脚本更新完成...\n"
  [ -d ${ScriptsDir}/node_modules ] && Notify_Version
  Npm_Install
else
  echo -e "js脚本更新失败，请检查原因或再次运行git_pull.sh...\n"
fi

## 调用用户自定义的diy.sh
if [ "${EnableExtraShell}" = "true" ]; then
  if [ -f ${FileDiy} ]
  then
    . ${FileDiy}
  else
    echo -e "${FileDiy} 文件不存在，跳过执行DIY脚本...\n"
  fi
fi
