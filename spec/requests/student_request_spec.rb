require 'rails_helper'

RSpec.describe "Students", type: :request do
  describe "profile should show specific users" do
    it "should get the first profile if passed id=1" do
      get "/students/profile", params: {:id=>1}
      expect(assigns(:student)).to eq(Student.find(1))
    end
    
    it "should get the signed user if logged in" do
      get "/students/profile", session: {:id=>1}
      expect(assigns(:student)).to eq(Student.find(1))
    end
    
    it "should get user 1 if there is nobody signed in by default" do
      #we should throw an error in the future
      get "/students/profile"
      expect(assigns(:student)).to eq(Student.find(1))
    end
  end
  
  describe "search should create specific queries" do
    it "should not query if no input is given" do
      get "/students/search"
      expect(assigns(:query)).to eq ({})
    end
    it "should query first and last name if given" do
      info = {:firstName=>"John",:lastName=>"Doe"}
      get "/students/search", params: {:student=> info}
      expect(assigns(:query)).to eq (info)
    end
    it "should query with set casing" do
      firstName = "JoHn"
      lastName = "dOe"
      advisor = "aDvIsOr"
      info = {:firstName=>firstName,:lastName=>lastName, :advisor=>advisor}
      query = {
        :firstName=>firstName.downcase.capitalize,
        :lastName=>lastName.downcase.capitalize,
        :advisor=>advisor.downcase.capitalize
      }
      get "/students/search", params: {:student=> info}
      expect(assigns(:query)).to eq (query)
    end
  end
end