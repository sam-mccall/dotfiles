function _arrow
  set_color -b $argv
  echo -n 
  set_color $argv
end

function fish_prompt
  set -l ss $status
  if [ $status != 0 ]
    set_color black
    _arrow brred
    _arrow yellow
    _arrow brred
    _arrow black
  else if true
    set_color black
    _arrow red
    _arrow bryellow
    _arrow blue
    _arrow black
  end
  echo -n ' '
  set_color normal
end

