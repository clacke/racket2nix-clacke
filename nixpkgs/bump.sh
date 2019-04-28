#!/usr/bin/env nix-shell
#! nix-shell --quiet -p bash gawk git nix -i bash

set -euo pipefail

OWNER=NixOS
REPO=nixpkgs-channels
DEFAULT_REV=refs/heads/nixpkgs-unstable

cd "$(dirname "${BASH_SOURCE[0]}")"

rev=${1:-$DEFAULT_REV}

if (( ${#rev} != 40 )); then
  rev=$(git ls-remote https://github.com/$OWNER/$REPO | awk '$2 == "'"$rev"'" { print $1 }')
fi

url="https://github.com/$OWNER/$REPO/archive/$rev.tar.gz"
hash=$(nix-prefetch-url --unpack "$url")
cat > url.json.new <<EOF
{
  "url": "$url",
  "sha256": "$hash"
}
EOF
mv url.json{.new,}
