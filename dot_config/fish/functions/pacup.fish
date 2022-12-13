# Defined in /tmp/fish.8CbU5R/pacup.fish @ line 2
function pacup --wraps=sudo\ pacman\ -Syu\ --noconfirm\nparu\ -Syu\ --noconfirm --wraps='sudo pacman -Syu'
  sudo pacman -Sy --noconfirm --needed archlinux-keyring
  sudo pacman -Su --noconfirm $argv
end
