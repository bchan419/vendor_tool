class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @email = params[:email]
    user = Employee.find_by_email(@email)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to projects_url, :notice => "Signed in as #{@email}."
    else
      flash[:notice] = 'Sign-in unsuccessful.'
      redirect_to projects_url
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url
  end

end
