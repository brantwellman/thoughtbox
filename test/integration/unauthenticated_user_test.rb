require 'test_helper'

class UnauthenticatedUserTest < ActionDispatch::IntegrationTest
  test "unauthenticated user redirected to login page" do
    visit root_path

    assert_equal enter_path, current_path
    assert page.has_link?("Login")
    assert page.has_content?("Sign Up")
  end

  test "unauthenticated user can sign up by clicking the signup button" do
    visit root_path
    click_on "Sign Up"

    fill_in "Email", with: "brant@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Submit"

    assert page.has_content?("All of the links!")
  end

  test "user cant sign up with an email that is already used" do
    create(:user)

    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: "brant@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Submit"

    assert page.has_content?("Email has already been taken")
  end

  test "user cant sign up with a password and confirmation that don't match" do
    create(:user)

    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: "brant@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password2"
    click_on "Submit"

    assert page.has_content?("Password confirmation doesn't match Password")
  end

  
end
