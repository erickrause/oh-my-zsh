sg () {
  if [ -f ./script/rails ]; then
    rails g $@
  else
    ./script/generate $@
  fi
}

function _cap_does_task_list_need_generating () {
  if [ ! -f .cap_tasks~ ]; then return 0;
  else
    accurate=$(stat -f%m .cap_tasks~)
    changed=$(stat -f%m config/deploy.rb)
    return $(expr $accurate '>=' $changed)
  fi
}

function _c () {
  # if [ -f config/deploy.rb ]; then
    _files -W ~/code -/
    # compadd `cat .cap_tasks~`
  # fi
}

compctl -K _c c

c() {
  cd ~/code/$1;
}
