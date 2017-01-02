function _compressed_path
  set -l parents (dirname $argv | string replace -ra "/([^/]{0,1})[^/]*" "\$1")
  if [ $parents != "" -a $parents != "." ]
    set_color $fish_color_parent
    echo $parents/
  end
  set_color $fish_color_cwd
  basename $argv
end

function fish_right_prompt
  _compressed_path (string replace -r "^$HOME" '~' $PWD)
  set_color 888
  date +" %k:%M"
  set_color normal
  echo ' '$machine_icon
end
