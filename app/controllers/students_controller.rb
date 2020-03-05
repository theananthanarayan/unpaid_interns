class StudentsController < ApplicationController
  def profile
    @student = Student.find(1)
    #Just a basic way to output the one person for now.  This will be fleshed out later
  end
  
  def message
  end 
end
