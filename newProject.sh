#!/bin/bash
# create a new TS Nodejs project with AVA test support

set -e # halt the script if an error occurs
NAME=$1

mkdir $NAME
cd $NAME
npm init -y
npm init ava
npm i -D  typescript ts-node
mkdir src
mkdir test

TSCONFIG=https://raw.githubusercontent.com/YizYah/testingWebinar/main/tsconfig.json

# AVA specs
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

# TypeScript specs
wget $TSCONFIG -O tsconfig.json
