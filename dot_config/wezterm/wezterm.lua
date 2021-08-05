local wezterm = require 'wezterm';

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
  local zoomed = ""
  if tab.active_pane.is_zoomed then
    zoomed = "[Z] "
  end

  local index = ""
  if #tabs > 1 then
    index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
  end

  return zoomed .. index .. tab.active_pane.title
end)

return {
  {{ if eq chezmoi.os "linux" }}
  default_prog = {'/usr/bin/fish'}
  {{ else }}
  default_prog = {'F:/@win/scoop/apps/pwsh/current/pwsh.exe'},
  {{ end }}
  font = wezterm.font("JetBrains Mono"),
  color_scheme = "Batman",
}

