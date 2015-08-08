#!/usr/bin/env bash
[[ $@ ]] || { echo 'No arguments given'; exit 1; }

HEROKU_APP=$1
REDIRECT_URL=$2

[ -z "$HEROKU_APP" ] && echo "HEROKU_APP was not given, see README" && exit 1;
[ -z "$REDIRECT_URL" ] && echo "REDIRECT_URL was not given, see README" && exit 1;

GIT_REPO="https://git.heroku.com/$HEROKU_APP.git"

heroku git:clone -a $HEROKU_APP
cd $HEROKU_APP
rm -rf *
rm .env .rubocop.yml .gitignore
cp -f ../config.ru ../Gemfile ../Gemfile.lock ../index.rb ../README.md .
git add .
git commit -am "Adding redirect app"
heroku config:add REDIRECT_URL=$REDIRECT_URL
git push --force heroku master
