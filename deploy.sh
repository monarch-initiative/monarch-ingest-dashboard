#!/usr/bin/env sh

set -e

# https://cli.vuejs.org/guide/deployment.html#github-pages

REMOTENAME=${1:-origin}
REMOTE=`git remote get-url --push ${REMOTENAME}`

# build
npm run build

cd dist

# if deploying to custom domain
# echo 'my.domain.org' > CNAME

git init
git add -A
git commit -m 'deploy to gh-pages'

git remote add ${REMOTENAME} ${REMOTE}
git push --force ${REMOTENAME} master:gh-pages

cd -
