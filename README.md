# hubot-is-the-door-open

Keeps track of whether or not the door is open.

See [`src/is-the-door-open.coffee`](src/is-the-door-open.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-is-the-door-open --save`

Then add **hubot-is-the-door-open** to your `external-scripts.json`:

```json
[
  "hubot-is-the-door-open"
]
```

## Sample Interaction

```
User> hubot is the door open?
Hubot> No, the door is closed. :(

User> hubot the door is open
Hubot> The door is open! :D

User> hubot is the door open?
Hubot> Yes, the door is open! :D

User> hubot is the door closed?
Hubot> No, the door is open! :D
```
