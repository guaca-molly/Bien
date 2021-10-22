class SessionsController < ApplicationController

    def new
      #login form
    end
    
    def create
      #actually try and log in
      @form_data = params.require(:session)
      #pull out the username and passwords from the form data
      @username = @form_data[:username]
      @password = @form_data[:password]

      #lets check that the user is who they say they are
      @user = User.find_by(username: @username).try(:authenticate, @password)
      #if there is a correct user present 
      if @user

        #save the user to the users session
        session[:user_id] = @user.id

        redirect_to root_path
      else
        render "new"
      end

    end

    def destroy
      #log us out
      #remove session completely
      reset_session
      #redirect to the log in page
      redirect_to new_session_path
    end

end
