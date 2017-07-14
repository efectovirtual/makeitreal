require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "a customer can't create a post if it's not authenticated" do
    user = users(:simon)
    post user_posts_path(user), params: {
      post: {
        content: 'Creando',
        title: 'Invalid Post'
      }
    }
    assert_redirected_to new_user_session_path
  end

  test "a customer can create a post if it is authenticated" do
    user = users(:simon)
    sign_in user
    post user_posts_path(user), params: {
      post: {
        content: 'Creando',
        title: 'Valid Post'
      }
    }

    assert_redirected_to user_post_path(user, Post.last)
    follow_redirect!
    assert_select '#post-content .row h1', 'Valid Post'
  end

  test "a customer can update it's own posts" do
    user = users(:simon)
    sign_in user
    post user_posts_path(user), params: {
      post: {
        content: 'Post to edit',
        title: 'Editing post'
      }
    }
    user_post = Post.last
    patch user_post_path(user, user_post), {
      params: {
        post: {
          title: 'New Title'
        }
      },
      xhr: true
    }

    assert_equal 'text/javascript', @response.content_type
    assert body.include?("New Title")
  end

  test "a user cannot update other user's post" do

  end
end
