class GradsController < ApplicationController
  
  def index
    @pw = params[:password]
    @em = params[:email]
    if @pw == nil || @pw == "" || @em == nil || @em == ""
      params[:password] = ""
      params[:email] = ""
      @pw = params[:password]
      @em = params[:email]
      @introMsg = "Guest"
    else
      tempUser = User.where(password: @pw, email: @em)
      if tempUser.exists?
        @introMsg = Student.find(tempUser.pluck(:studentID)[0]).firstName + " " + Student.find(tempUser.pluck(:studentID)[0]).lastName
      else
        params[:password] = ""
        params[:email] = ""
        @pw = params[:password]
        @em = params[:email]
        @introMsg = "Guest"
        flash[:notice] = "Sorry, Incorrect Login"
      end
    end
  end
  
  def search
    @pw = params[:password]
    @em = params[:email]
    if @pw == nil || @pw == "" || @em == nil || @em == ""
      params[:password] = ""
      params[:email] = ""
      @pw = params[:password]
      @em = params[:email]
      @introMsg = "Guest"
    else
      tempUser = User.where(password: @pw, email: @em)
      @introMsg = Student.find(tempUser.pluck(:studentID)[0]).firstName + " " + Student.find(tempUser.pluck(:studentID)[0]).lastName
    end
  end
  
  def new
  end
end
