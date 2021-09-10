function pacin --wraps=pacman --wraps='sudo pacman -S' --description 'pacman alias to install apps'
  sudo pacman -S --noconfirm --needed $argv; 
end
