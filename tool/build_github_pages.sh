#!/usr/bin/env bash

set -euo pipefail

base_href="${1:-}"

if [[ -z "${base_href}" ]]; then
  remote_url="$(git config --get remote.origin.url)"
  repo_name="${remote_url##*/}"
  repo_name="${repo_name%.git}"
  base_href="/${repo_name}/"
fi

case "${base_href}" in
  /*/) ;;
  *)
    echo "Base href must start and end with '/'. Received: ${base_href}" >&2
    exit 1
    ;;
esac

flutter build web --base-href "${base_href}"
cp build/web/index.html build/web/404.html
touch build/web/.nojekyll

echo "Built web app for GitHub Pages with base href ${base_href}"
