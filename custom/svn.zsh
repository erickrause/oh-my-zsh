# svn
alias sup='svn up'
alias sst='svn st'
alias sstu='svn st -u'
alias sci='svn ci -m'
alias sdiff='svn diff | colordiff'
alias smate='svn diff | mate && svn ci'
alias sadd="sst | grep '?' | cut -c5- | xargs svn add"

