require 'rack-flash'

class SongsController < ApplicationController

  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash


get '/songs/new' do
  @genres = Genre.all
  erb:'/songs/new'
end

post '/songs' do
  @song = Song.create(params[:song])
  @song.update(artist_id: Artist.find_or_create_by(name: params[:artist_name]).id)
  @song.genres << Genre.find(params[:genres])
  @song.save


  flash[:message] = "Successfully created song."
  redirect to "/songs/#{@song.slug}"
end


get '/songs' do
  @songs = Song.all
  erb :'/songs/index'
end

get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])
  erb :'/songs/show'
end

get '/songs/:slug/edit' do
  @song = Song.find_by_slug(params[:slug])
  @genres = Genre.all
  erb :'/songs/edit'
end

patch '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])

    @song.update(params[:song])

      puts "!!!!!!!!!!!!!!!!!#{@song.name}"
    @song.update(artist_id: Artist.find_or_create_by(name: params[:artist_name]).id)
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."

  redirect to "/songs/#{@song.slug}"
end
end
