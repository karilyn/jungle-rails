class SessionsController < ApplicationController

  def new
  end

  def create
    # Verify user exists in db and run has_secure_password's .authenticate()
    # method to see if the password submitted on the login form was correct:
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user.id in that user's session cookie:
      session[:user_id] = user.id.to_s
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      # if email or password incorrect, re-render login page:
      flash.now.alert = "Incorrect email or password. Please try again."
      render :new
    end
  end

  def destroy
   log_out
   redirect_to root_url, notice: 'Succesfully logged out!'
  end


end
