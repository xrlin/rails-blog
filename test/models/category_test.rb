require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "name should not be blank" do
    category = Category.new()
    assert_equal category.valid?, false
    category = Category.new(name: '')
    assert_equal category.valid?, false
    category = Category.new(name: '    ')
    assert_equal category.valid?, false
  end

  test "should create new category" do
    assert_difference "Category.count", +1 do
      Category.create(name: 'Test')
    end
  end

  test "test fixture should have two posts" do
    assert_equal categories(:test).posts.count, 2
  end

  test "create with slug" do
    c = Category.create(name: '测试 Slug')
    assert_equal c.slug, 'ce-shi-slug'
  end
end
