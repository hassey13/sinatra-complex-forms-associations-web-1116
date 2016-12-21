class OwnersController < ApplicationController

  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index'
  end

  get '/owners/new' do
    @pets = Pet.all
    erb :'/owners/new'
  end

  post '/owners' do
      @owner = Owner.create(params[:owner])
      @pet = Pet.find(params[:pet_id]) if params[:pet_id]
      @pet = Pet.create(params[:pet]) unless params[:pet][:name] == ""
      @pet.owner_id = @owner.id if @pet
      @pet.save if @pet
      redirect "/owners/#{@owner.id}"
  end

  get '/owners/:id/edit' do
    @owner = Owner.find(params[:id])
    @pets = Pet.all
    erb :'/owners/edit'
  end

  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  patch '/owners/:id' do
    @owner = Owner.find(params[:id])
    @owner.update(params[:owner])
    redirect "/owners/#{@owner.id}"
  end
end
