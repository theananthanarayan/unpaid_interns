class StudentsController < ApplicationController
  
  def setSession(session)
    session[:password] = ""
    session[:email] = ""
  end
  
  def index
    @pw = session[:password]
    @em = session[:email]
    flash[:notice] = ""
    if @pw == nil || @pw == "" || @em == nil || @em == ""
      defaultInfo
    else
      tempStudent = Student.where(password: @pw, email: @em)
      if tempStudent.exists?
        @introMsg = tempStudent.pluck(:firstName)[0] + " " + tempStudent.pluck(:lastName)[0]
      else
        defaultInfo
        flash[:notice] = "Sorry, Incorrect Login"
      end
    end
  end
  
  def login
    session[:password] = params[:password]
    session[:email] = params[:email]
    redirect_to students_index_url
  end
  
  def logout
    defaultInfo
    redirect_to students_index_url
  end
  
  def search
    studentHash = params[:student]
    @attributes = [:firstName, :lastName, :advisor, :classYear] 
    query = {}
    @attributes.each do |attribute|
      if studentHash[attribute.to_s]!= ''
        query[attribute]=studentHash["firstName"]
      end
    end
    
    @result = Student.where(query).select(@attributes)
  end
  
  def defaultInfo
    session[:password] = ""
    session[:email] = ""
    @pw = session[:password]
    @em = session[:email]
    @introMsg = "Guest"
  end
  
  def new
  end
  
  def create
    @p = params[:student]
    @student = Student.create!([{firstName: @p[:firstName], lastName: @p[:lastName], classYear: 0000, advisor: "", intro: "", research: [], colleagues: [], careers: [], profilePic: "", password: @p[:password], email: @p[:email]}])
    flash[:notice] = "New User Created.  Now log in."
    redirect_to students_index_url
  end
  
  def profile
    if params.has_key?(:id)
      @student = Student.find(params[:id])
    elsif session.has_key?(:password) and session.has_key?(:email)
      @pw = session[:password]
      @em = session[:email]
      @student = Student.where(password: @pw, email: @em)
      @student = @student.take()
    else 
      @student = Student.find(1)    #temp invalid student handling 
    end
  end

  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @p = params[:student]
    @student = Student.find(params[:id])
    @student.update_attributes!({firstName: @p[:firstName], lastName: @p[:lastName], classYear: @p[:classYear], advisor: @p[:advisor], intro: @p[:intro]})
    redirect_to students_profile_url(password: @student.password, email: @student.email)
  end
  
  def message
    @pw = session[:password]
    @em = session[:email]
  end 

end 
    
    
