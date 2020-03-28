class StudentsController < ApplicationController
  def profile
    @pw = params[:password]
    @em = params[:email]
    @student = Student.find(1)
    @studName = @student.firstName + " " + @student.lastName
    
    if(User.where(password: @pw, email: @em).pluck(:studentID)[0] == @student.id)
      @studName = @studName + " (You)"
    end
  end
  
  def message
    @pw = params[:password]
    @em = params[:email]
  end 



  
  def searchBox
    @fn = params[:first_name]
    @ln = params[:last_name]
    @adv = params[:advisor]
    @clsyr = params[:class_year]
    if @fn == nil || @fn == ""
      @result = Student.where(lastName: @ln, advisor: @adv, classYear: @clsyr).select("field1, field2, field3, field4")
    elsif @ln == nil|| @ln == ""
      @result = Student.where(firstName: @fn, advisor: @adv, classYear: @clsyr).select("field1, field2, field3, field4")
    elsif @adv == nil || @adv == ""
      @result = Student.where(firstName: @fn, lastName: @ln, classYear: @clsyr).select("field1, field2, field3, field4")
    elsif @clsyr == nil || @clsyr == ""
      @result = Student.where(firstName: @fn, lastName: @ln, advisor: @adv).select("field1, field2, field3, field4")
    elsif @fn == nil || @fn == "" && @ln == nil|| @ln == ""
      @result = Student.where(advisor: @adv, classYear: @clsyr).select("field1, field2, field3, field4")
    elsif @fn == nil || @fn == "" && @adv == nil || @adv == ""
      @result = Student.where(lastName: @ln, classYear: @clsyr).select("field1, field2, field3, field4")
    elsif @fn == nil || @fn == "" && @clsyr == nil || @clsyr == ""
      @result = Student.where(lastName: @ln, advisor: @adv).select("field1, field2, field3, field4")
    elsif @ln == nil|| @ln == "" && @adv == nil || @adv == ""
      @result = Student.where(firstName: @fn, classYear: @clsyr).select("field1, field2, field3, field4")
    elsif @ln == nil|| @ln == "" && @clsyr == nil || @clsyr == ""
      @result = Student.where(firstName: @fn, advisor: @adv).select("field1, field2, field3, field4")
    elsif @adv == nil || @adv == "" && @clsyr == nil || @clsyr == ""
      @result = Student.where(firstName: @fn, lastName: @ln).select("field1, field2, field3, field4")
    elsif @fn == nil || @fn == "" && @ln == nil|| @ln == "" && @adv == nil || @adv == ""
      @result = Student.where(classYear: @clsyr).select("field1, field2, field3, field4")
    elsif @fn == nil || @fn == "" && @ln == nil|| @ln == "" && @clsyr == nil || @clsyr == ""
      @result = Student.where(advisor: @adv).select("field1, field2, field3, field4")
    elsif @ln == nil|| @ln == "" && @adv == nil || @adv == "" && @clsyr == nil || @clsyr == ""
      @result = Student.where(firstName: @fn).select("field1, field2, field3, field4")
    elsif @fn == nil || @fn == "" && @adv == nil || @adv == "" && @clsyr == nil || @clsyr == ""
      @result = Student.where(lastName: @ln).select("field1, field2, field3, field4")
    elsif @fn == nil || @fn == "" && @ln == nil|| @ln == "" && @adv == nil || @adv == "" && @clsyr == nil || @clsyr == ""
      flash[:notice] = "Please fill out the form"
    else 
      @result = Student.where(firstName: @fn, lastName: @ln, advisor: @adv, classYear: @clsyr).select("field1, field2, field3, field4")
    end 
  end
  


end
