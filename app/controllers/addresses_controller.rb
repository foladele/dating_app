class AddressesController < ApplicationController

  def index
  	@addresses = Address.all
  end

  def new
   
    @person = Person.find(params[:person_id])
  	@address = Address.new
  end

  def create

    @person = Person.find(params[:address][:person_id])
  	@person.address = Address.new(address_params)
  	if @person.save
  		redirect_to address_path(@person.address)
  	else
  		render :new
  	end
  end

  def edit
  	@address = Address.find(params[:id])
  end

  def update
  	@address = Address.find(params[:id])
  	if @address.update(address_params)
  		redirect_to address_path(@address)
  	else
  		render :edit
  	end
  end

  def show
  	@address = Address.find(params[:id])
  end

  private

  	def address_params
  		params.require(:address).permit(:city, :state, :zip, :street, :person_id)
  		
  	end
end