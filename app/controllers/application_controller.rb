require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/team' do
      @teams = Team.new(params[:team])

      params[:team][:heroes].each do |details|
        Hero.new(details)
      end

      @heroes = Superhero.all

      erb :team
    end
end
