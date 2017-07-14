require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:hola_mundo)
  end
  test "it should create a post with title and contet" do
    user = users(:simon)
    post = Post.new title: 'Hola', content: 'My content', user: user
    assert post.save
  end

  test "it should validate content should be less than 140 chars" do
    @post.content = 'k' * 141
    @post.validate
    assert_includes @post.errors[:content], 'is too long (maximum is 140 characters)'
  end

  test "post should be valid" do
    assert @post.valid?
  end

  test "it should validate content should be greater than 0 chars" do
    @post.content = ''
    @post.validate
    assert_includes @post.errors[:content], 'is too short (minimum is 1 character)'
  end

  test "it should validate content must exists" do

  end

  test "it should validate title should be less than 100 chars" do

  end

  test "it should validate title should be greater than 0 chars" do

  end

  test "it should validate title must exists" do

  end
end
