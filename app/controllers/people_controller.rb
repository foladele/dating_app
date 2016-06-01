class PeopleController < ApplicationController
  def index
    @user_id = current_user.id
    @people = Person.all
    if params[:search]
      @people = Person.search(params[:search])
    else
    	@people = Person.all
    end
    
  end

  def show
  	@person = Person.find(params[:id])
    @user = current_user
    @person.address
  end

  def new

    @user = current_user.id
  	@person = Person.new 
  end

  def create
    @user_id = current_user.id
    @person = Person.new(person_params)
    @person.user_id = @user_id
  	if @person.save
  		redirect_to person_path(@person)
  	else
  		render :new
  	end
  end

  def edit
  	@person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to person_path(@person)
    else
      render :edit
    end
  end

  def search
  end

  def destroy
    Person.find(params[:id]).destroy
    redirect_to people_path
  end

  private
  	def person_params
  		params.require(:person).permit(:name, :age, :gender, :user_id, :image)
  	end
end
