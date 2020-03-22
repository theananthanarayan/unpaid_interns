class StudentsController < ApplicationController
  def profile
    @pw = params[:password]
    @student = Student.find(1)
    @studName = @student.firstName + " " + @student.lastName
    
    if(User.where(password: @pw) == User.where(studentID: @student.id))
      @studName = @studName + " (You)"
    end
  end
  
  def message
    @pw = params[:password]
  end 
end
