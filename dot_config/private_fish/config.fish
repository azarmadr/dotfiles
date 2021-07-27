#source /home/azarmadr/.local/share/pearl/boot/fish/pearl.fish
set -gx EDITOR nvim
zoxide   init fish               | source
#zoxide   init fish --no-aliases | source
starship init fish               | source
/usr/bin/rakubrew init Fish | source
