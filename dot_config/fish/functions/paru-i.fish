# Defined via `source`
function paru-i --wraps='paru -S --noconfirm --needed' --description 'alias paru-i=paru -S --noconfirm --needed'
  paru -S --noconfirm --needed $argv; 
end
