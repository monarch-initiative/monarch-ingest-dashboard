#!/usr/bin/env sh

set -e

# https://cli.vuejs.org/guide/deployment.html#github-pages

# Note that this guide doesn't build an app that supports
# visiting non-root pages directly
# eg https://kshefchek.github.io/kg-covid-dash/about 404s

# See https://github.com/monarch-initiative/monarch-ui/blob/master/src/gh_404.html
# for a (probably outdated) hack around this

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
