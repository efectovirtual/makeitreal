require "application_system_test_case"

class CreateCommentsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit create_comments_url
  #
  #   assert_selector "h1", text: "CreateComment"
  # end
  test "a user can create a comment" do
    simon = users(:simon)
    post = simon.posts.first
    visit new_post_comment_path(post)
    fill_in 'comment_content', with: 'Awesome Post'
    click_button 'Create'
    assert_equal post_path(post), current_path
    assert_selector '#comments tbody tr td p', text: 'Awesome Post'
  end
end
