require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/count.rb'

before do
  if Count.all.size == 0
    Count.create(number: 0)
  end
end

get '/' do
  @number = Count.first.number
  erb :index
end

post '/plus' do
    count = Count.first
    count.number = count.number + 1
    count.save
    redirect '/'
end

post '/minus' do
    count = Count.first
    count.number = count.number - 1
    count.save
    redirect '/'
end

post '/kake' do
    count = Count.first
    count.number = count.number * 2
    count.save
    redirect '/'
end

post '/wari' do
    count = Count.first
    count.number = count.number / 2
    count.save
    redirect '/'
end