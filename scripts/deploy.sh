#!/bin/bash
#Auth: bell@greedlab.com
#
# deploy
#

# 当前目录
CURRENT_DIR=${PWD}

# 脚本所在目录
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)

## blog 目录
BLOG_DIRECTORY=${SCRIPT_DIR}/..

GITHUB_REF=github.com/zjsrose/zjsheng_blog.git

if ! [ -n "${GITHUB_API_KEY}" ]; then
  echo "no valid GITHUB_API_KEY"
  exit 1
fi

# update master
# echo update SUMMARY.md and README.md
# cd ${BLOG_DIRECTORY}
# git remote add upstream https://GreedBell:${GITHUB_API_KEY}@${GITHUB_REF}
# git fetch upstream
# git reset upstream/master
#
# git config user.email "bell@greedlab.com"
# git config user.name "Bell"
# git add . --all
# git commit -m "update SUMMARY.md and README.md by travis"
# git push -q upstream HEAD:master > /dev/null 2>&1

# deploy the gh-pages
echo Deploy to GitHub Pages
cd ${BLOG_DIRECTORY}/_book
git init
git config user.email "bell@greedlab.com"
git config user.name "Bell"
git remote add upstream https://greedbell:${GITHUB_API_KEY}@${GITHUB_REF}
git fetch upstream
git reset upstream/gh-pages
git add . --all
git commit -m "Deploy to GitHub Pages by travis"
git push -q upstream HEAD:gh-pages

cd ${CURRENT_DIR}
