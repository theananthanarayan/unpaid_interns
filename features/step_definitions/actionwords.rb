# encoding: UTF-8

module Actionwords
  def you_enter_your_required_information

  end

  def you_put_in_the_required_information

  end

  def you_create_your_account

  end

  def i_am_on_the_home_page
    visit('/')
  end

  def i_should_see_a_go_to_profile_link

  end

  def i_click_go_to_profile
    click_link('Go to Profile')
  end

  def i_should_be_on_the_profile_page_with_the_correct_p1(p1 = "")

  end

  def i_should_see_the_correct_p1_p2_p3_p4_and_p5(p1 = "", p2 = "", p3 = "", p4 = "", p5 = "")
    page.has_content?(p1)
    page.has_content?(p2)
    page.has_content?(p3)
  end
end