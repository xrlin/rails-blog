require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    p = Post.create(title: SecureRandom.base64, body:'', tag_list: ['test1', 'test1'])
    get tag_url(p.tags.first)
    assert_response :success
  end

end
