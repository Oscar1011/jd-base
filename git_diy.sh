#!/usr/bin/env bash

ShellDir=/jd

source ${ShellDir}/notify.sh

git_url=$1
git_branch=$2
author=$3
diyscripts=/jd/alljs/${author}

if [ ! -d ${diyscripts} ]; then
  git clone -b ${git_branch} ${git_url} ${diyscripts}
fi

cd ${diyscripts}
git pull
gitpullstatus=$?
git reset --hard origin/${git_branch}


rand(){
    min=$1
    max=$(($2-$min+1))
    num=$(cat /proc/sys/kernel/random/uuid | cksum | awk -F ' ' '{print $1}')
    echo $(($num%$max+$min))
}
function updatefile {
  cd ${diyscripts}
  for js in `ls *.js`;
    do
     cp $js /jd/scripts/${author}_$js
  done
}
function addnewcron {
  addname=""
  cd ${diyscripts}
  for js in `ls *.js`;
    do 
      croname=`echo "${author}_$js"|awk -F\. '{print $1}'`
      script_date=`cat  $js|grep ^[0-9]|awk '{print $1,$2,$3,$4,$5}'|sort |uniq|head -n 1`
      [ -z "${script_date}" ] && script_date=`cat  $js|grep -Eo "([0-9]+|\*|[0-9]+[,-].*) ([0-9]+|\*|[0-9]+[,-].*) ([0-9]+|\*|[0-9]+[,-].*) ([0-9]+|\*|[0-9]+[,-].*) ([0-9]+|\*|[0-9][,-].*)"|sort |uniq|head -n 1`
      [ -z "${script_date}" ] && cron_min=$(rand 1 59) && cron_hour=$(rand 7 9) && script_date="${cron_min} ${cron_hour} * * *"
      [ $(grep -c "$croname" /jd/config/crontab.list) -eq 0 ] && sed -i "/\#diy/a${script_date} bash jd $croname"  /jd/config/crontab.list && \cp $js /jd/scripts/${author}_$js && addname="${addname}\n${croname}"
  done

  if [ "$addname" != "" ]; then
      echo -e "成功添加新的定时任务：\n\n${addname}" > ${ContentNewTask}
      Notify_NewTask
  fi
  #[ "$addname" != "" ] && /bin/sh  /jd/scripts/wechat.sh "${author}新增自定义脚本" "${addname}"

}

function delcron {
  delname=""
  cronfiles=$(grep "$author" /jd/config/crontab.list|awk -F"${author}_" '{print $2}')
  for filename in $cronfiles;
    do
      if [ ! -f "${diyscripts}/${filename}.js" ]; then 
        sed -i "/bash jd ${author}_${filename}/d" /jd/config/crontab.list 
	      delname="${delname}\n${author}_${filename}"
      fi
  done
  if [ "$delname" != "" ]; then
      echo -e "删除失效的定时任务：\n\n${delname}" > ${ContentDropTask}
      Notify_DropTask
  fi
  #[ "$delname" != "" ] && /bin/sh  /jd/scripts/wechat.sh "${author}删除失效脚本" "${delname}"    
}

if [[ ${gitpullstatus} -eq 0 ]]
then
  updatefile
  addnewcron
  delcron
fi

