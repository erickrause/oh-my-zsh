function c() {
   cd ~/code/$1;
}

#compdef c
function _c () {
  _files -W ~/code -/
}

compdef _c c