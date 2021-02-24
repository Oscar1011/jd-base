ShellDir=/jd
ContentNewTask=${ShellDir}/new_task
ContentDropTask=${ShellDir}/drop_task
ContentMessage=${ShellDir}/message

## 发送删除失效定时任务的消息
function Notify_DropTask {
  cd ${ShellDir}
  node update.js
  [ -f ${ContentDropTask} ] && rm -f ${ContentDropTask}
}

## 发送新的定时任务消息
function Notify_NewTask {
  cd ${ShellDir}
  node update.js
  [ -f ${ContentNewTask} ] && rm -f ${ContentNewTask}
}


## 发送新的定时任务消息
function Notify_NewTask {
  cd ${ShellDir}
  node update.js
  [ -f ${ContentMessage} ] && rm -f ${ContentMessage}
}