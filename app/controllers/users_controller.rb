class UsersController < ApplicationController

  def find_current_user
    if is_logged_in?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end 
    
  def index
    @users = User.all
    @user = User.find_by(username: params[:id])
    @logged_in_user_reviews = @current_user.reviews

   

  end

  def edit
    #find the individual user profile to edit
     @current_user = User.find(session[:user_id])
  end

  def update
    #find the individual user
    @current_user = User.find(session[:user_id])
    
    #update with the new info from the form
    @current_user.update(form_params)
    #redirect somewhere
    redirect_to users_path
  end

  

  def show
    @user = User.find_by(username: params[:id])
    @reviews = @user.reviews
  end 

  def new
    #a form for adding a new user
    @user = User.new
  end

  def create 
    #take the params from the form
    #create a new user
    @user = User.new(form_params)
    #if its valid and it saves, go to the list users page
    #if not see the forms with errors
    if @user.save
      #save the session with the user
      session[:user_id] = @user.id

      redirect_to users_path
    else
      render "new"
    end

  end 

  def form_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end

end
