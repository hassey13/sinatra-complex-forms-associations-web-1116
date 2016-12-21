class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end

  post '/pets' do
    @pet = Pet.create(params[:pet])
    if params[:owner][:name] == ""
      @pet.owner_id = params[:owner_id].to_i
      @pet.save
    else
      @owner = Owner.create(params[:owner])
      @pet.owner_id = @owner.id
      @pet.save
    end
    redirect to "pets/#{@pet.id}"
  end

  patch '/pets/:id' do
    @pet = Pet.find(params[:id])
    @pet.update(params[:pet])
    if params[:owner][:name] == ""
      @pet.owner_id = params[:owner_id].to_i
      @pet.save
    else
      @owner = Owner.create(params[:owner])
      @pet.owner_id = @owner.id
      @pet.save
    end
    redirect to "pets/#{@pet.id}"
  end
end
