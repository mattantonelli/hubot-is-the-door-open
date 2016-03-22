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
  robot.respond /(?:is the )?door ?([\w ]+)\?/i, (res) ->
    status = res.match[1]
    if isStatus(status)
      res.send "Yes, the door is #{status}."
    else
      res.send "No, the door is not #{status}."

  robot.respond /(?:the )?door (?:is )?([\w ]+)(?![\w ]|\?)/i, (res) ->
    status = res.match[1]
    update(status)
    res.send "The door is #{status}."

  update = (status) ->
    robot.brain.set(KEY, status.toLowerCase())

  isStatus = (status) ->
    status.toLowerCase() == robot.brain.get(KEY)
