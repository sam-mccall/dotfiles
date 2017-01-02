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
  if functions -q vcinfo; and set -l vc (vcinfo)
    set_color c80
    echo $vc[1]:
    _compressed_path $vc[2]
  else
    _compressed_path (string replace -r "^$HOME" '~' $PWD)
  end
  set_color 888
  date +" %k:%M"
  set_color normal
  echo ' '$machine_icon
end
