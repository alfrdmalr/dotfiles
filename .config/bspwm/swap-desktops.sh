#! /bin/sh
target_desktop=$@
origin_desktop=$(bspc query --desktops --names --desktop focused)

if [ -z $@ ]
  then exit 1
fi

# if current/target are same, exit

echo $target_desktop
echo $origin_desktop

# --follow keeps the focus on $origin_desktop
bspc desktop --swap $target_desktop --follow
# renames $origin_desktop to "temp"
bspc desktop --rename temp
# switch the origin and target names
bspc desktop --focus $target_desktop
bspc desktop --rename $origin_desktop 
bspc desktop --focus temp
bspc desktop --rename $target_desktop 


