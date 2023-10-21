{ procps, spotify, writeShellScriptBin } :
writeShellScriptBin
  "spotify"
  ''
  PATH=
  set -euo pipefail
  shopt -s shift_verbose

  checkErrorReturn()
  {
    ${spotify}/bin/spotify
    local return=$?

    echo "Return: $return"
    [[ $return == 133 ]]
  }

  while checkErrorReturn
  do
    ${procps}/bin/pkill -TERM '^\.spotify-wrappe' || true
  done
  ''
