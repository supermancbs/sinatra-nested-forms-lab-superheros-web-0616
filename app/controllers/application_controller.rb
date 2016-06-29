require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
      erb :super_hero
    end 
# {"team"=>
#   {"name"=>"Team Ruby",
#    "motto"=>"We love Ruby!",
#    "heroes"=>
#     [{"name"=>"Amanda", "power"=>"Ruby", "biography"=>"I love Ruby!"},
#      {"name"=>"Arel", "power"=>"JavaScript", "biography"=>"I love JavaScript!"},
#      {"name"=>"Katie", "power"=>"Sinatra", "biography"=>"I love Sinatra!"}]}}

    post '/teams' do 

      @team = Team.new(params[:team][:name], params[:team][:motto])
      params[:team][:heroes].each do |hero|
        Hero.new(hero[:name], hero[:power], hero[:biography])
      end 
      @heroes = Hero.all
      erb :team
    end 


end
