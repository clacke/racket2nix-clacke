#! /usr/bin/env nix-shell
#! nix-shell --pure -p bash nix racket-minimal -i bash

set -e
set -u

SCRIPT_NAME=${BASH_SOURCE[0]##*/}
cd "${BASH_SOURCE[0]%${SCRIPT_NAME}}"

./racket2nix --thin ./nix |
  sed -e '/src = /,/}/{s@.*src = .*@  src = builtins.path { path = ./nix; name = "racket2nix"; };@p;d}' > racket2nix-thin.nix.new
mv racket2nix-thin.nix{.new,}
