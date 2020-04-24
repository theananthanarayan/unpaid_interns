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
    if(user != nil)
      session[:id]=user.id
    end
    redirect_to students_index_url
  end
  
  def logout
    defaultInfo
    redirect_to students_index_url
  end
  
  def search
    @attributes = [:firstName, :lastName, :advisor, :classYear] 
    studentHash = {}
    
    unless params[:student].nil?
      studentHash = params[:student]
    end
  
    @query = studentHash.map{|k,v| [k.to_sym,v.downcase.capitalize]}
                       .select{|k,v| @attributes.include?(k) and not v ==""}
                       .to_h
    unless @query == {}
      @result = Student.where(@query).select(@attributes,:id)
    else
      @result = Student.where(:id=>"")
    end
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
  
  def array_param(a)
    eval(a)
  end
  
  def update
    @p = params[:student]
    @student = Student.find(params[:id])
    @student.update_attributes!({firstName: @p[:firstName], lastName: @p[:lastName], classYear: @p[:classYear], advisor: @p[:advisor], intro: @p[:intro], research: eval(@p[:research]), colleagues: eval(@p[:colleagues]), careers: eval(@p[:careers])})
    redirect_to students_profile_url(id: @student.id)
  end
  
  def message
    @pw = session[:password]
    @em = session[:email]
    unless session.has_key?(:id)
      redirect_to students_index_url    #Ideally should go to a login page
    end
    @student_id = session[:id]
    @convo_id = params[:convo_id] || 1    #Ideally should go to a messaging homepage if no param set
    #unless Conversation.exists?(@convo_id) and Conversation.find(@convo_id).student_ids.include? @student_id
    #  redirect_to students_index_url    #Ideally should go to a messaging homepage if no param set
    #end
    @messages = Message.where(:conversation_id=>@convo_id).select(:content,:student_id).all()
  end 
end