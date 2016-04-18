require 'test_helper'

class UserCanSubmitandViewLinksTest < ActionDispatch::IntegrationTest
  test "user can submit a new link from the index page" do
    user = User.create(email: "me@email.com", password: "password")
    login(user)

    assert_equal root_path, current_path

    fill_in "Title", with: "Facebook"
    fill_in "Url", with: "https://www.facebook.com"
    click_on "Submit"

    assert page.has_content?("Facebook")
    assert page.has_content?("https://www.facebook.com")
  end
end
