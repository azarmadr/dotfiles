function ll --wraps='exa -lG --color=always --group-directories-first --icons' --description 'alias ll=exa -lG --color=always --group-directories-first --icons'
  exa -lG --color=always --group-directories-first --icons --octal-permissions $argv;
end
