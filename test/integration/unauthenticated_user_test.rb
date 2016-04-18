require 'test_helper'

class UnauthenticatedUserTest < ActionDispatch::IntegrationTest
  test "unauthenticated user redirected to login page" do
    visit root_path

    assert_equal enter_path, current_path
    assert page.has_link?("Login")
    assert page.has_content?("Sign Up")
  end
end
