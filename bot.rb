#!/usr/bin/env ruby -w
# frozen_string_literal: true

# https://ngrok.com/
# https://github.com/meew0/discordrb
# https://medium.com/@goodatsports/how-to-make-a-simple-discord-bot-in-ruby-to-annoy-your-friends-f5d0438daa70

# Hm, looks like Discord doesn't use a webhook-based 
# API, it'll be hard to keep this up & running on Heroku.

require 'discordrb/webhooks'

puts 'Bot init.'

bot = Discordrb::Bot.new token: ENV['DISCORD_KEY'],
                         client_id: 594_955_934_456_086_615

bot.mention do |event|
  event.user.pm('Er, I thought it would be
    nice for you to know how I work.')
end
bot.message(with_text: 'Hi') { |event| event.respond('Hello.') }

bot.message(content: 'Ping!') do |event|
  m = event.respond('Pong!')
  m.edit "Pong! Time taken: #{Time.now - event.timestamp} seconds."
end

bot.run
