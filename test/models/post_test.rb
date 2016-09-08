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

  test "fixture one should belongs to category test" do
    assert posts(:one).category == categories(:test)
  end

  test "post should act as taggable" do
    tag_list = [:test1, :test2]
    post = Post.new(title: 'sdfsdf', body: '', tag_list: tag_list)
    assert_equal post.tag_list.count, 2
  end

  test "create with slug" do
    p = Post.create(title: '测试 Slug', body: '')
    assert_equal p.slug, 'ce-shi-slug'
  end

end
