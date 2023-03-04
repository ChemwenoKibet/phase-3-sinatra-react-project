class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    "WELCOME TO PETFINDER"
  end

  #view all the pets available
  get "/pets" do
    pets = Pet.all
    pets.to_json
  end

  #search for a specific pet using its id
  get '/pets/:id' do |id|
    pet = Pet.find(id)
    if pet
      pet.to_json
    else
      halt 404, { error: "Pet with id #{id} not found" }.to_json
    end
  end
  

  #view all the users
  get "/users" do
    users = User.all
    users.to_json
  end  

  #add new pets
  post "/pets/addpet/:id" do
    new_pet = Pet.find(params[:id]).pets.create(
      name: params[:name], 
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


  #search for pet through name 
  get '/pets/findpet/:name' do |name|
    pet = Pet.find_by(name: name)
    if pet
      pet.to_json
    else
      halt 404, { error: "Pet with name #{name} not found" }.to_json
    end
  end


  #update age of new pet added
  patch '/pets/:id/update_age' do |id|
    pet = Pet.find { |p| p[:id] == id.to_i }
  
    if pet
      request.body.rewind
      data = JSON.parse(request.body.read)
      pet[:age] = data['age']
      { message: "Pet with id #{id} age updated successfully", data: pet }.to_json
    else
      halt 404, { error: "Pet with id #{id} not found" }.to_json
    end
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



