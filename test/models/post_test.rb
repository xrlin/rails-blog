require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "should not allow empty title" do
    # validates nil, blank?
    post = Post.new(body: 'test')
    assert_equal post.valid?, false
    post = Post.new(title: '', body: 'test')
    assert_equal post.valid?, false
    post = Post.new(title: '     ', body: 'test')
    assert_equal post.valid?, false
  end

  test "should create new post" do
    assert_difference 'Post.count', 1 do
      Post.create(title: 'Test', body: 'Hello world')
    end
  end
end
