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

  test "user sees error message for an invalid url submission" do
    user = User.create(email: "me@email.com", password: "password")
    login(user)

    assert_equal root_path, current_path

    fill_in "Title", with: "Facebook"
    fill_in "Url", with: "hs:/w.facebook.com"
    click_on "Submit"

    assert page.has_content?("Url is not a valid URL")
  end

  test "user sees only his own links" do
    Link.create(title: "Facebook", url: "https://www.facebook.com")

    user = User.create(email: "me@email.com", password: "password")
    user.links << Link.create(title: "MyPlace", url: "https://www.myplace.com")
    login(user)

    assert page.has_content?("MyPlace")
    refute page.has_content?("Facebook")
  end
end
