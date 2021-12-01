#!/bin/bash
# create a new TS Nodejs project with AVA test support

set -e # halt the script if an error occurs

# (a) create directories and add packages
NAME=$1

mkdir $NAME
cd $NAME
npm init -y
npm init ava
npm i -D  typescript ts-node
mkdir src
mkdir test
mkdir test/int
mkdir test/unit


# (b) update JSON
jq '.ava = {
    "files": [
      "test/**/*.test.ts"
    ],
    "extensions": [
      "ts"
    ],
    "require": [
      "ts-node/register"
    ] 
  }' package.json | sponge package.json


jq '.scripts = {
    "build": "tsc",
    "commit": "git-cz",
    "coverage": "nyc npm test",
    "int-test": "ava --config int-tests.config.cjs",
    "lint": "eslint \"src/**/*.ts\"",
    "lintfix": "eslint \"src/**/*.ts\" --fix",
    "prepack": "rm -rf lib && tsc -b",
    "report": "nyc report --reporter=json",
    "test": "ava",
    "view-coverage": "nyc --extension .ts ava --forbid-only"
  }' package.json | sponge package.json



# (c) download files
TS_CONFIG=https://raw.githubusercontent.com/YizYah/testingWebinar/main/tsconfig.json
wget $TS_CONFIG -O tsconfig.json

INT_CONFIG=https://raw.githubusercontent.com/YizYah/testingWebinar/main/int-tests.config.cjs
wget $INT_CONFIG -O int-tests.config.cjs

GIT_IGNORE=https://raw.githubusercontent.com/YizYah/testingWebinar/main/.gitignore
wget $GIT_IGNORE -O .gitignore


# make sure git is initialized
git init
git add . && git commit -m “init”
mkdir .github
mkdir .github/workflows

