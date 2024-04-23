import std/strutils

import futhark

proc myRename(name, kind: string, partof = ""): string =
  result = name
  # Special-case libvlc_new
  if result == "libvlc_new":
    result = "newVlc"
  else:
    result = result.replace("libvlc_", "")

when defined(linux):
  importc:
    path "/usr/include/vlc"
    renameCallback myRename
    "vlc.h"
