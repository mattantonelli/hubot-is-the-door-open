chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'is-the-door-open', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/is-the-door-open')(@robot)

  it 'registers a respond listener for the status command', ->
    expect(@robot.respond).to.have.been.calledWith(/(?:is the )?door ?([\w ]+)\?/i)

  it 'registers a respond listener for the update command', ->
    expect(@robot.respond).to.have.been.calledWith(/(?:the )?door (?:is )?([\w ]+)(?![\w ]|\?)/i)
