#!/usr/bin/env bash
#author:spark thanks to: https://github.com/sparkssssssss/scripts

ShellDir=/jd

source ${ShellDir}/notify.sh

declare -A BlackListDict
author=$1
repo=$2
dir=$3
#指定仓库屏蔽关键词,不添加计划任务,多个按照格式二
BlackListDict['i-chenzhe']="_get|backup"
BlackListDict['sparkssssssss']="smzdm|tg|xxxxxxxx"

blackword=${BlackListDict["${author}"]}
blackword=${blackword:-"wojiushigejimo"}

if [ $# -lt 2 ] && [ $# -gt 3 ] ; then
  echo "USAGE: $0 author repo         #for all repo"
  echo "USAGE: $0 author repo  dir    #for special dir of the repo"
  exit 0;
fi

diyscriptsdir=/jd/alljs
mkdir -p ${diyscriptsdir}

if [ ! -d "$diyscriptsdir/${author}_${repo}" ]; then
  echo -e "${author}本地仓库不存在,从gayhub拉取ing..."
  cd ${diyscriptsdir} &&  git clone https://ghproxy.com/https://github.com/${author}/${repo}.git ${author}_${repo}
  gitpullstatus=$?
  [ $gitpullstatus -eq 0 ] && echo -e "${author}本地仓库拉取完毕"
  [ $gitpullstatus -ne 0 ] && echo -e "${author}本地仓库拉取失败,请检查!" && exit 0
else
  cd ${diyscriptsdir}/${author}_${repo}
  branch=`git symbolic-ref --short -q HEAD`
  git fetch --all
  git reset --hard origin/$branch
  git pull
  gitpullstatus=$?
fi

rand(){
    min=$1
    max=$(($2-$min+1))
    num=$(cat /proc/sys/kernel/random/uuid | cksum | awk -F ' ' '{print $1}')
    echo $(($num%$max+$min))
}

function updatefile {
  cd ${diyscriptsdir}/${author}_${repo}
  for js in `ls *.js`;
    do
     cp $js /jd/scripts/${author}_$js
  done
}


function addnewcron {
  addname=""
  if [ -n $dir ];then
    cd ${diyscriptsdir}/${author}_${repo}/$dir
    author=${author}_${dir}
  else
    cd ${diyscriptsdir}/${author}_${repo}
  fi
  [ $(grep -c "#${author}" /jd/config/crontab.list) -eq 0 ] && sed -i "/hangup/a#${author}" /jd/config/crontab.list
  
  for jspath in `ls *.js|egrep -v $blackword`; 
  #for jspath in `find ./ -name  "*.js"|egrep -v $blackword`; 
  #for js in `ls *.js|egrep -v $blackword`;
    do 
      newflag=0
      js=`echo $jspath|awk -F'/' '{print $NF}'` 
      croname=`echo "${author}_$js"|awk -F\. '{print $1}'`
      script_date=`cat  $js|grep ^[0-9]|awk '{print $1,$2,$3,$4,$5}'|egrep -v "[a-zA-Z]|:|\."|sort |uniq|head -n 1`
      [ -z "${script_date}" ] && script_date=`cat  $jspath|grep -Eo "([0-9]+|\*|[0-9]+[,-].*) ([0-9]+|\*|[0-9]+[,-].*) ([0-9]+|\*|[0-9]+[,-].*) ([0-9]+|\*|[0-9]+[,-].*) ([0-9]+|\*|[0-9][,-].*)"|sort |uniq|head -n 1`
      [ -z "${script_date}" ] && cron_min=$(rand 1 59) && cron_hour=$(rand 7 9) && script_date="${cron_min} ${cron_hour} * * *"
      [ $(grep -c -w "$croname" /jd/config/crontab.list) -eq 0 ] && sed -i "/#${author}/a${script_date} bash jd $croname"  /jd/config/crontab.list && addname="${addname}\n${croname}" && echo -e "添加了新的脚本${croname}." && newflag=1;
      [ $newflag -eq 1 ] && bash jd ${croname} now >/dev/null &

      if [ $(egrep -v "^#|nochange" /jd/config/crontab.list|grep -c -w "$croname" ) -eq 1 ];then
          old_script_date=$(grep -w "$croname" /jd/config/crontab.list|awk '{print $1,$2,$3,$4,$5}')
	  [ "${old_script_date}" != "${script_date}" ] && sed -i "/bash jd $croname/d" /jd/config/crontab.list && sed -i "/#${author}/a${script_date} bash jd $croname"  /jd/config/crontab.list
      fi

      if [ ! -f "/jd/scripts/${author}_$js" ];then
        \cp $jspath /jd/scripts/${author}_$js
      else
        change=$(diff $jspath /jd/scripts/${author}_$js)
        [ -n "${change}" ] && \cp $jspath /jd/scripts/${author}_$js && echo -e "${author}_$js 脚本更新了."

      fi
  done
  #[ "$addname" != "" ] && notify "新增 ${author} 自定义脚本" "${addname}"
  if [ "$addname" != "" ]; then
      echo -e "新增 ${author} 自定义脚本 ${addname}" > ${ContentNewTask}
      Notify_NewTask
  fi
}

function delcron {
  delname=""
  if [ -n $dir ];then
    jspath=${diyscriptsdir}/${author}_${repo}/$dir
    author=${author}_${dir}
  else
    jspath=${diyscriptsdir}/${author}_${repo}
  fi
  cronfiles=$(grep "$author" /jd/config/crontab.list|grep -v "^#"|awk '{print $8}'|awk -F"${author}_" '{print $2}')
  for filename in $cronfiles;
    do
      if [ ! -f "$jspath/${filename}.js" ]; then 
        sed -i "/\<bash jd ${author}_${filename}\>/d" /jd/config/crontab.list && echo -e "删除失效脚本${filename}."
	delname="${delname}\n${author}_${filename}"
      fi
  done
  #[ "$delname" != "" ] && notify  "删除 ${author} 失效脚本" "${delname}" 
  if [ "$delname" != "" ]; then
      echo -e "删除 ${author} 失效脚本 ${delname}" > ${ContentDropTask}
      Notify_DropTask
  fi
}

if [[ ${gitpullstatus} -eq 0 ]]
then
  addnewcron
  delcron
else
  echo -e "$author 仓库更新失败了."
  #notify "自定义仓库更新失败" "$author"
fi

exit 0
