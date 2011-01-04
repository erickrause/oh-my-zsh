# general shortcuts
alias c='cd '
alias mv='mv -i'
alias v='vmstat'
alias md=mkdir

# Need to do this so you use backspace in screen...I have no idea why
alias screen='TERM=screen screen'

# listing files
alias l='ls -alh'
alias ltr='ls -ltr'
alias lth='l -t|head'
alias lh='ls -Shl | less'
alias tf='tail -f -n 100'
alias t500='tail -n 500'
alias t1000='tail -n 1000'
alias t2000='tail -n 2000'

# editing shortcuts
alias m='mvim --remote-silent'

# grep for a process
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# top level folder shortcuts
alias src='cd ~/code'

# display battery info on your Mac
# see http://blog.justingreer.com/post/45839440/a-tale-of-two-batteries
alias battery='ioreg -w0 -l | grep Capacity | cut -d " " -f 17-50'

