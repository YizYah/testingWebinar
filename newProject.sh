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

# (b) AVA specs
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

# (c) TypeScript specs
TSCONFIG=https://raw.githubusercontent.com/YizYah/testingWebinar/main/tsconfig.json
wget $TSCONFIG -O tsconfig.json
