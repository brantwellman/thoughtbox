require 'test_helper'

class UserUpdatesLinkStatusTest < ActionDispatch::IntegrationTest
  test "User clicks on Mark as Read link and observes change" do
    user = User.create(email: "me@email.com", password: "password")
    user.links << Link.create(title: "MyPlace", url: "https://www.myplace.com")
    login(user)

    assert page.has_content?("Mark as Read")
    refute page.has_content?("Mark as Unread")

    click_on("Mark as Read")

    assert page.has_content?("Mark as Unread")
  end

  test "User clicks on Mark as Unread link and observes change" do
    user = User.create(email: "me@email.com", password: "password")
    user.links << Link.create(title: "MyPlace", url: "https://www.myplace.com", read: true)
    login(user)

    assert page.has_content?("Mark as Unread")
    refute page.has_content?("Mark as Read")

    click_on("Mark as Unread")

    assert page.has_content?("Mark as Read")
  end
end
