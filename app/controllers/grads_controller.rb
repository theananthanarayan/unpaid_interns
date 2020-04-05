class GradsController < ApplicationController
  
  def index
    @pw = params[:password]
    @em = params[:email]
    flash[:notice] = ""
    if @pw == nil || @pw == "" || @em == nil || @em == ""
      defaultInfo
    else
      tempUser = User.where(password: @pw, email: @em)
      if tempUser.exists?
        @introMsg = Student.find(tempUser.pluck(:studentID)[0]).firstName + " " + Student.find(tempUser.pluck(:studentID)[0]).lastName
      else
        defaultInfo
        flash[:notice] = "Sorry, Incorrect Login"
      end
    end
  end
  
  def search
    @pw = params[:password]
    @em = params[:email]
    if @pw == nil || @pw == "" || @em == nil || @em == ""
      defaultInfo
    else
      tempUser = User.where(password: @pw, email: @em)
      @introMsg = Student.find(tempUser.pluck(:studentID)[0]).firstName + " " + Student.find(tempUser.pluck(:studentID)[0]).lastName
    end
  end
  
  def defaultInfo
    params[:password] = ""
    params[:email] = ""
    @pw = params[:password]
    @em = params[:email]
    @introMsg = "Guest"
  end
  
  def new
  end
  
  def create
    @student = Student.create!([{firstName: params[:firstName], lastName: params[:lastName], classYear: 0000, advisor: "", intro: "", research: [], colleagues: [], careers: [], profilePic: ""}])
    @user = User.create!([{studentID: @student.id, password: params[:password], email: params[:email]}])
    flash[:notice] = "New User Created.  Now log in."
    redirect_to grads_index_url
  end
end
