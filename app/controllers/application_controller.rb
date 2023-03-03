class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    "WELCOME TO PETFINDER"
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

  #add new pets
  post "/pets" do
    new_pet = Pet.create(name: params[:name], 
      breed: params[:breed],
      age: params[:age]
    )
    new_pet.to_json
  end

  #view all new pets added
  get "/pets/newpets" do
    pets = Pet.all
    pets.to_json     

  end


  #search for pet through name or breed
get "/pet/search" do
  

end


  #update age of new pet added
  patch '/pets/:id' do 
    pet = Pet.find_by(id: params[:id])
    pet.update(age: params[:age])
    pet.to_json(include: :users)
  end


  #delete new pets
  delete '/users/:id' do 
    user = User.find_by(id: params[:id])
    user.destroy
    user.to_json
  end


  #remove details of new pets added
  delete '/pets/:age' do
    pet = Pet.find_by(age: params[:age])
    pet.update(age: nil)
  end


  #not able to update pets not added

end



