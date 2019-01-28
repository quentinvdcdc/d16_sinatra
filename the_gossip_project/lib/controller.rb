require 'gossip'

class ApplicationController < Sinatra::Base
	get '/' do
  	erb :index, locals: {gossips: Gossip.all}
	end
  get '/gossips/new/' do
    erb :new_gossip
  end
  get '/gossips/edit/:id/' do
    erb :edit_gossip, locals: {gossip: Gossip.find(params['id'].to_i), identation: params['id']}
  end
  get '/gossips/:id/' do
  	erb :gossip_with_index, locals: {gossip: Gossip.find(params['id'].to_i), identation: params['id']}
	end
  post '/gossips/new/' do
  	puts Gossip.new(params["gossip_author"], params["gossip_content"]).save
  redirect '/'
	end
	post '/gossips/edit/:id/' do
  	puts Gossip.update(params['id'].to_i, params["update_author"], params["update_content"])
  redirect '/'
	end
	post '/gossips/:id/' do
  	puts Gossip.comment(params["display_comment"])
  redirect '/'
	end
end