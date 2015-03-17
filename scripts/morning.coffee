# Description:
#   Hubot, be polite and say hello.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   Hello or Good Day make hubot say hello to you back
#   Good Morning makes hubot say good morning to you back
ONE_DAY = 86400000
last_time_i_wouldnt_shut_the_fuck_up = 0
hellos = [
    "Well hello there, %",
    "Hey %, Hello!",
    "Marnin', %",
    "Good day, %",
    "Good 'aye!, %",
    "Hello, %! Gosh, has it been already a day?"
]
mornings = [
    "Good morning, %",
    "Good morning to you too, %",
    "Good day, %",
    "Good 'aye!, %"
]
module.exports = (robot) ->
    robot.hear /(he(ll|rr)o|good( [d'])?ay(e)?)/i, (msg) ->
        now = Date.now()
        if now - last_time_i_wouldnt_shut_the_fuck_up > ONE_DAY
            last_time_i_wouldnt_shut_the_fuck_up = now
            hello = msg.random hellos
            msg.send hello.replace "%", msg.message.user.name

    robot.hear /(^(good )?m(a|o)rnin(g)?)/i, (msg) ->
        hello = msg.random mornings
        msg.send hello.replace "%", msg.message.user.name
