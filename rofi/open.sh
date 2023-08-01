call_menu() {
    echo ' set wallpaper'
    [ "$(ps aux | grep cfw | grep -v 'grep\|rofi\|nvim')" ] && echo '󰄛 close clash' || echo '󰄛 open clash'
}

execute_menu() {
  case $1 in
      ' set wallpaper')
          feh --randomize --bg-fill ~/wallpaper/*.png
          ;;
      '󰄛 open clash')
          coproc (eval cd ~/Clash;./cfw > /dev/null)
          ;;
      '󰄛 close clash')
          killall cfw
          ;;
  esac
}

execute_menu "$(call_menu | rofi -dmenu -p "menu" -theme ~/.config/rofi/Red.rasi)"
