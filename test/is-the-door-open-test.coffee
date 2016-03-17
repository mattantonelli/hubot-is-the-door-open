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

  it 'registers a respond listener for the is open command', ->
    expect(@robot.respond).to.have.been.calledWith(/is the door open/)

  it 'registers a respond listener for the is closed command', ->
    expect(@robot.respond).to.have.been.calledWith(/is the door closed/)

  it 'registers a respond listener for the open command', ->
    expect(@robot.respond).to.have.been.calledWith(/the door is open/)

  it 'registers a respond listener for the close command', ->
    expect(@robot.respond).to.have.been.calledWith(/the door is closed/)

