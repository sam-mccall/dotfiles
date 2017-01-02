function fish_prompt
  set -l ss $status
  set -l cursor \U25ba
  if [ $fish_key_bindings = "fish_vi_key_bindings" ]
    switch $fish_bind_mode
      case default
        set cursor \U2605
      case replace-one
        set_color black -b green
        echo -n 'R'
      case visual
        set cursor \U2423
    end
  end
  if [ $ss != 0 ]
    set_color f00
  else
    set_color ff0
  end
	echo -n $cursor' '
	set_color normal
end

