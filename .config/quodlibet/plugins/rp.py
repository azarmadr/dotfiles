import os
import pathlib
from quodlibet.plugins.events import EventPlugin

class pathupdater(EventPlugin):
    PLUGIN_ID = "pathupdate"
    PLUGIN_NAME = ("Update PurePosixPath")
    PLUGIN_DESC = _("Updates the Windows Path and stores into location tag")
    PLUGIN_ICON = Icons.DOCUMENT_OPEN

    def PluginPreferences(self, _):
        lib = app.library
        for song in list(lib):
            fn = song['~filename']
            wp = pathlib.PureWindowsPath(os.path.realpath(fn))
            lp = pathlib.PurePosixPath('/strg', *wp.parts[1:])
            try:
                lo = song['location']
                if lo != lp:
                    song['location'] = lp
                return
            except KeyError:
                song['location'] = lp
                return
