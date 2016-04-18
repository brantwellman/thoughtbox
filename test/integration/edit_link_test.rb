require 'test_helper'

class EditLinnkTest < ActionDispatch::IntegrationTest
  test "authenticated user can edit title of link and see result" do
    user = User.create(email: "me@email.com", password: "password")
    user.links << Link.create(title: "MyPlace", url: "https://www.myplace.com")
    login(user)

    assert page.has_content?("MyPlace")
    refute page.has_content?("YourPlace")

    click_on("Edit")
    fill_in "Title", with: "YourPlace"
    fill_in "Url", with: "https://www.myplace.com"
    click_on "Submit"

    assert page.has_content?("YourPlace")
  end

  test "authenticated user can edit url of link and see result" do
    user = User.create(email: "me@email.com", password: "paswword")
    user.links << Link.create(title: "MyPlace", url: "https://www.myplace.com")
    login(user)

    assert page.has_content?("https://www.myplace.com")
    refute page.has_content?("https://www.yourplace.com")

    click_on("Edit")
    fill_in "Title", with: "MyPlace"
    fill_in "Url", with: "https://www.yourplace.com"
    click_on "Submit"

    assert page.has_content?("https://www.yourplace.com")
  end

  test "authenticated user cannot edit url to an invalid url - sees error message" do
    user = User.create(email: "me@email.com", password: "password")
    user.links << Link.create(title: "MyPlace", url: "https://www.myplace.com")
    login(user)

    click_on("Edit")
    fill_in "Title", with: "MyPlace"
    fill_in "Url", with: "ht;/ww.yourplace.com"
    click_on "Submit"

    assert page.has_content?("Url is not a valid URL")
  end
end
