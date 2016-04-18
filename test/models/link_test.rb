require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test "an invalid url is not saved" do
    Link.create(title: "Facebook", url: "https://www.facebook.com")

    assert_equal 1, Link.all.count

    Link.create(title: "Google", url: "htt:???www.google.com")

    assert_equal 1, Link.all.count
  end
end
