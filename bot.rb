#!/usr/bin/env ruby -w
# frozen_string_literal: true

# https://ngrok.com/
# https://github.com/meew0/discordrb
# https://medium.com/@goodatsports/how-to-make-a-simple-discord-bot-in-ruby-to-annoy-your-friends-f5d0438daa70

require 'discordrb'

puts 'Bot init.'

bot = Discordrb::Bot.new token: ENV['DISCORD_KEY'],
                         client_id: 594_955_934_456_086_615

bot.mention { |event| event.user.pm('Hello!') }

bot.message(content: 'Ping!') do |event|
  m = event.respond('Pong!')
  100.times do
    m.edit "Pong! Time taken: #{Time.now - event.timestamp} seconds."
  end
end

bot.run
