# Description
#   A Hubot script that add new issue to GitHub when you says "Hubotスクリプトほしい"
#
# Dependencies:
#   "github": "^0.2.1",
#   "q": "^1.0.1"
#
# Configuration:
#   HUBOT_SCRIPT_HOSHII_USER
#   HUBOT_SCRIPT_HOSHII_REPO
#   HUBOT_SCRIPT_HOSHII_TOKEN
#
# Commands:
#   Hubotスクリプトほしい - add new issue to GitHub
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  {Promise} = require 'q'
  GitHubApi = require 'github'

  user = process.env.HUBOT_SCRIPT_HOSHII_USER
  repo = process.env.HUBOT_SCRIPT_HOSHII_REPO
  token = process.env.HUBOT_SCRIPT_HOSHII_TOKEN

  createIssue = (title) ->
    new Promise (resolve, reject) ->
      github = new GitHubApi version: '3.0.0'
      github.authenticate type: 'oauth', token: token
      github.issues.create {
        user: user
        repo: repo
        title: title
        labels: []
      }, (err, res) ->
        return reject(err) if err?
        resolve
          number: res.number
          title: res.title
          url: res.html_url

  robot.hear /(.+?)\s*Hubot\s*(?:スクリプト|-?scripts?)\s*が?ほしい/i, (res) ->
    name = res.match[1] + 'Hubotスクリプトほしい'
    createIssue name
      .then (issue) ->
        res.send "\##{issue.number} #{issue.title}\n#{issue.url}"
