# Defined in /tmp/fish.8CbU5R/pacup.fish @ line 2
function pacup --wraps=sudo\ pacman\ -Syu\ --noconfirm\nparu\ -Syu\ --noconfirm --wraps='sudo pacman -Syu'
  sudo pacman -Syu --noconfirm $argv
end
