# Description
#   Keeps track of whether or not the door is open.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot is the door open   - tells you if the door is open
#   hubot is the door closed - tells you if the door is closed
#   hubot the door is open   - lets hubot know the door is open
#   hubot the door is closed - lets hubot know the door is closed
#
# Author:
#   github.com/mattantonelli

KEY = 'is-the-door-open'

module.exports = (robot) ->
  robot.respond /is the door open/i, (res) ->
    if isOpen()
      res.send 'Yes, the door is open! :D'
    else
      res.send 'No, the door is closed. :('

  robot.respond /is the door closed/i, (res) ->
    if isOpen()
      res.send 'No, the door is open! :D'
    else
      res.send 'Yes, the door is closed. :('

  robot.respond /the door is open/i, (res) ->
    open()
    res.send 'The door is open! :D'

  robot.respond /the door is closed/i, (res) ->
    close()
    res.send 'The door is closed. :('

  open = ->
    robot.brain.set(KEY, true)

  close = ->
    robot.brain.set(KEY, false)

  isOpen = ->
    robot.brain.get(KEY)
