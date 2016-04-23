# -*- coding: utf-8 -*-
require 'esa'
require 'dotenv'

Dotenv.load

client = Esa::Client.new(access_token: ENV['ACCESS_TOKEN'], current_team: ENV['CURRENT_TEAM'])
client.user

n = ENV['LAST_NUMBER'].to_i # last article number

for i in 1..n do
  response = client.post(i).body
  title    = response["name"]
  body     = response["body_md"]
  f        = File::open("#{title}.md", 'w')
  f.write(body)
  sleep(0.1)
end
