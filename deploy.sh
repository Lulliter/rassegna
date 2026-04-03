#!/usr/bin/env bash

#===========================  (Push to Github repo)  ================================#
# --- Check status
git status

# --- Add changes to git Index.
git add -A

# --- git commit + push
git commit -m "deploy" && git push origin master

#===========================  (Sync docs/ to Aruba VPS)  ================================#
# Run from the root of any repo: bash deploy.sh
# The repo folder name becomes the subfolder name on the VPS ("set REPO_NAME to the name of the folder I'm currently in")

REPO_NAME="$(basename "$PWD")"

# ====== SYNC docs/ to VPS
rsync -avz --delete docs/ root@94.177.201.108:/var/www/html/${REPO_NAME}/

# ====== SYNC landing page (only if Aruba_VPS repo is available locally)
LANDING="${HOME}/Github/Aruba_VPS/Aruba_index.html"
if [ -f "${LANDING}" ]; then
  rsync -avz "${LANDING}" root@94.177.201.108:/var/www/html/
fi
