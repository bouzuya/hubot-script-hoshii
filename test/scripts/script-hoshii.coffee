{Robot, User, TextMessage} = require 'hubot'
assert = require 'power-assert'
path = require 'path'
sinon = require 'sinon'

describe 'script-hoshii', ->
  beforeEach (done) ->
    @env = {}
    @env.user = process.env.HUBOT_SCRIPT_HOSHII_USER
    @env.repo = process.env.HUBOT_SCRIPT_HOSHII_REPO
    @env.token = process.env.HUBOT_SCRIPT_HOSHII_TOKEN
    process.env.HUBOT_SCRIPT_HOSHII_USER = 'user'
    process.env.HUBOT_SCRIPT_HOSHII_REPO = 'repo'
    process.env.HUBOT_SCRIPT_HOSHII_TOKEN = 'token'
    @sinon = sinon.sandbox.create()
    # for warning: possible EventEmitter memory leak detected.
    # process.on 'uncaughtException'
    @sinon.stub process, 'on', ->
    @robot = new Robot(path.resolve(__dirname, '..'), 'shell', false, 'hubot')
    @robot.adapter.on 'connected', =>
      @robot.load path.resolve(__dirname, '../../src/scripts')
      done()
    @robot.run()

  afterEach (done) ->
    process.env.HUBOT_SCRIPT_HOSHII_USER = @env.user
    process.env.HUBOT_SCRIPT_HOSHII_REPO = @env.repo
    process.env.HUBOT_SCRIPT_HOSHII_TOKEN = @env.token

    @robot.brain.on 'close', =>
      @sinon.restore()
      done()
    @robot.shutdown()

  describe 'listeners[0].regex', ->
    beforeEach ->
      @callback = @sinon.spy()
      @robot.listeners[0].callback = @callback

    describe 'receive "すごいHubotスクリプトほしい', ->
      beforeEach ->
        @sender = new User 'bouzuya', room: 'hitoridokusho'
        message = 'すごいHubotスクリプトほしい'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'calls *issue* with "すごいHubotスクリプトほしい"', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is 'すごいHubotスクリプトほしい'
        assert match[1] is 'すごい'

    describe 'receive "すごいhubotスクリプトほしい', ->
      beforeEach ->
        @sender = new User 'bouzuya', room: 'hitoridokusho'
        message = 'すごいhubotスクリプトほしい'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'calls *issue* with "すごいhubotスクリプトほしい"', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is 'すごいhubotスクリプトほしい'
        assert match[1] is 'すごい'

    describe 'receive "すごいhubotスクリプトほしい', ->
      beforeEach ->
        @sender = new User 'bouzuya', room: 'hitoridokusho'
        message = 'すごいhubotスクリプトほしい'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'calls *issue* with "すごいhubotスクリプトほしい"', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is 'すごいhubotスクリプトほしい'
        assert match[1] is 'すごい'

    describe 'receive "すごいhubot scriptsほしい', ->
      beforeEach ->
        @sender = new User 'bouzuya', room: 'hitoridokusho'
        message = 'すごいhubot scriptsほしい'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'calls *issue* with "すごいhubot scriptsほしい"', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is 'すごいhubot scriptsほしい'
        assert match[1] is 'すごい'

    describe 'receive "すごいhubot scripts ほしい', ->
      beforeEach ->
        @sender = new User 'bouzuya', room: 'hitoridokusho'
        message = 'すごいhubot scripts ほしい'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'calls *issue* with "すごいhubot scripts ほしい"', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert 'すごいhubot scripts ほしい'
        assert @callback.firstCall.args[0].match[1] is 'すごい'

    describe 'receive "すごい hubot scripts ほしい', ->
      beforeEach ->
        @sender = new User 'bouzuya', room: 'hitoridokusho'
        message = 'すごい hubot scripts ほしい'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'calls *issue* with "すごい hubot scripts ほしい"', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is 'すごい hubot scripts ほしい'
        assert match[1] is 'すごい'

    describe 'receive "すごい hubot-scripts ほしい', ->
      beforeEach ->
        @sender = new User 'bouzuya', room: 'hitoridokusho'
        message = 'すごい hubot-scripts ほしい'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'calls *issue* with "すごい hubot-scripts ほしい"', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is 'すごい hubot-scripts ほしい'
        assert match[1] is 'すごい'

    describe 'receive "すごい hubot script ほしい', ->
      beforeEach ->
        @sender = new User 'bouzuya', room: 'hitoridokusho'
        message = 'すごい hubot script ほしい'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'calls *issue* with "すごい hubot script ほしい"', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is 'すごい hubot script ほしい'
        assert match[1] is 'すごい'

    describe 'receive "すごい hubot script がほしい', ->
      beforeEach ->
        @sender = new User 'bouzuya', room: 'hitoridokusho'
        message = 'すごい hubot script がほしい'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'calls *issue* with "すごい hubot script がほしい"', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is 'すごい hubot script がほしい'
        assert match[1] is 'すごい'

    describe 'receive "とても かっこいい hubot script がほしい', ->
      beforeEach ->
        @sender = new User 'bouzuya', room: 'hitoridokusho'
        message = 'とても かっこいい hubot script がほしい'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'calls *issue* with "とても かっこいい hubot script がほしい"', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is 'とても かっこいい hubot script がほしい'
        assert match[1] is 'とても かっこいい'

    describe 'receive "hubot script がほしい', ->
      beforeEach ->
        @sender = new User 'bouzuya', room: 'hitoridokusho'
        message = 'hubot script がほしい'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'does not call', ->
        assert @callback.callCount is 0

  describe 'listeners[0].callback', ->
    beforeEach ->
      @issue = @robot.listeners[0].callback

    describe 'receive "すごい hubot script ほしい"', ->
      beforeEach ->
        GitHub = require 'github'
        {issues} = require 'github/api/v3.0.0/issues'
        @sinon.stub GitHub.prototype, 'authenticate', -> null
        @sinon.stub issues, 'create', (msg, block, callback) ->
          callback null,
            number: 9
            title: 'すごいHubotスクリプトほしい'
            html_url: 'https://github.com/hitoridokusho/hibot/issues/9'
        @send = @sinon.spy()
        @issue
          match: ['すごい hubot script ほしい', 'すごい']
          send: @send

      it 'send "#9 すごいHubotスクリプトほしい\\nhttps://github.com/..."', ->
        assert @send.callCount is 1
        assert @send.firstCall.args[0] is '''
          #9 すごいHubotスクリプトほしい
          https://github.com/hitoridokusho/hibot/issues/9
          '''
