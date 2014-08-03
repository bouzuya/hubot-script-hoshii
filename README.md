# hubot-script-hoshii

A Hubot script that add new issue to GitHub when you says "Hubotスクリプトほしい"

## Installation

    $ npm install git://github.com/bouzuya/hubot-script-hoshii.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-script-hoshii.git#TAG'

## Sample Interaction

    bouzuya> すごいHubotスクリプトほしい
    hubot> #8 すごいHubotスクリプトほしい
    https://github.com/hitoridokusho/hibot/issues/8

See [`src/scripts/script-hoshii.coffee`](src/scripts/script-hoshii.coffee) for full documentation.

## License

MIT

## Development

### Run test

    $ npm test

### Run robot

    $ npm run robot


## Badges

[![Build Status][travis-status]][travis]

[travis]: https://travis-ci.org/bouzuya/hubot-script-hoshii
[travis-status]: https://travis-ci.org/bouzuya/hubot-script-hoshii.svg?branch=master
