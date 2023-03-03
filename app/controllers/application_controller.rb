class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    "Hello world"
  end

  get "/pets" do
    pets = Pet.all
    pets.to_json
  end

  get "/users" do
    users = User.all
    users.to_json
  end  

end
