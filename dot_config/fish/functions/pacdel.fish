# Defined via `source`
function pacdel --wraps='sudo pacman -Rs ' --description 'alias pacdel=sudo pacman -Rs '
  sudo pacman -Rs  $argv; 
end
