# Defined in - @ line 1
function psgrep --wraps='ps as | grep' --wraps='ps ax | grep' --description 'alias psgrep ps ax | grep'
  ps ax | grep $argv;
end
