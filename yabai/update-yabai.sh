#!/usr/bin/env sh
set -x

# stop, and upgrade yabai
brew services stop yabai
brew upgrade yabai

# uninstall the scripting addition
sudo yabai --uninstall-sa

# installing the scripting addition will restart Dock.app
sudo yabai --install-sa

# finally, start yabai
brew services start yabai
