# encoding: UTF-8

module Actionwords

  def i_am_on_the_home_page
    visit('/')
  end

  def i_should_see_a_go_to_profile_link
    i_type_my_email_and_password
    click_the_sign_in_button
    has_link?("Profile")
  end

  def i_click_go_to_profile
    click_link("Profile")
  end

  def i_should_be_on_the_profile_page_with_the_correct_p1(p1 = "")

  end


  def i_should_see_a_email_and_password_field
    have_text('Email')
    have_text('Password')
  end

  def i_type_my_email_and_password
    fill_in 'email', :with => 'jackblack@gmail.com'
    fill_in 'password', :with =>'Octagons888'
  end

  def click_the_sign_in_button
    click_button "Sign In"
  end

  def i_should_be_signed_in
    have_link "Logout"
  end
end