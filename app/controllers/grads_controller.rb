class GradsController < ApplicationController
  
  def index
    @pw = params[:password]
    if @pw == nil || @pw == ""
      @introMsg = "Guest"
    else
      tempUser = User.where(password: @pw)
      @introMsg = Student.find(tempUser.pluck(:studentID)[0]).firstName + " " + Student.find(tempUser.pluck(:studentID)[0]).lastName
    end
  end
  
  def search
    @pw = params[:password]
    if params[:password] == nil || params[:password] == ""
      @introMsg = "Guest"
    else
      tempUser = User.where(password: params[:password])
      @introMsg = Student.find(tempUser.pluck(:studentID)[0]).firstName + " " + Student.find(tempUser.pluck(:studentID)[0]).lastName
    end
  end
  
  def new
  end
end
