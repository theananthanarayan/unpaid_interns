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
      @tempStudent = Student.where(password: @pw, email: @em)
      if @tempStudent.exists?
        @introMsg = @tempStudent.pluck(:firstName)[0] + " " + @tempStudent.pluck(:lastName)[0]
        @ID = @tempStudent.pluck(:id)[0]
      else
        defaultInfo
        flash[:notice] = "Sorry, Incorrect Login"
      end
    end
  end
  
  def login
    session[:password] = params[:password]
    session[:email] = params[:email]
    pw = session[:password]
    em = session[:email]
    user = Student.where(password: pw, email: em).select(:id)
    user = user.take()
    session[:id]=user.id
    redirect_to students_index_url
  end
  
  def logout
    defaultInfo
    redirect_to students_index_url
  end
  
  def search
    @attributes = [:firstName, :lastName, :advisor, :classYear] 
    studentHash = {}
    query = {}
    
    unless params[:student].nil?
      studentHash = params[:student]
    end
  
    @attributes.each do |attribute|
      if studentHash[attribute.to_s]!= '' && studentHash[attribute.to_s]!=nil
        query[attribute]=studentHash[attribute].downcase.capitalize
      end
    end
    @result = Student.where(query).select(@attributes,:id)
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
    elsif session.has_key?(:id)
      @student = Student.find(session[:id])
    else 
      @student = Student.find(1)    #temp invalid student handling 
    end
    @hasOwnership = false
    if session.has_key?(:id)
      @hasOwnership = @student.id==session[:id]
    end
    @display = [:research,:advisor, :colleagues,:careers]
  end

  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @p = params[:student]
    @student = Student.find(params[:id])
    @student.update_attributes!({firstName: @p[:firstName], lastName: @p[:lastName], classYear: @p[:classYear], advisor: @p[:advisor], intro: @p[:intro]})
    redirect_to students_profile_url(id: @student.id)
  end
  
  def message
    @pw = session[:password]
    @em = session[:email]
    @tempStudent = Student.where(password: @pw, email: @em)
    @tempStudent = @tempStudent.take()
  end 
end