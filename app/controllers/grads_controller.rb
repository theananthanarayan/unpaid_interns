class GradsController < ApplicationController
  
  def index
    if params[:password] == nil || params[:password] == ""
      @introMsg = "Guest"
    else
      tempUser = User.where(password: params[:password])
      @introMsg = Student.find(tempUser.pluck(:studentID)[0]).firstName
      #@introMsg = Student.find(1).firstName
    end
  end
  
  def new
  end
end
