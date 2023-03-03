class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    "Hello world"
  end

  #view all the pets
  get "/pets" do
    pets = Pet.all
    pets.to_json
  end

  #view all the users
  get "/users" do
    users = User.all
    users.to_json
  end  

