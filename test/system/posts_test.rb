require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  setup do
    @admin_auth = { user: admin_username, password: admin_password }

    @post = posts(:one)
  end

  test 'visiting the index' do
    visit posts_url
    assert_selector 'h1', text: 'Listing posts'
  end

  test 'creating a Post' do
    visit posts_url(@admin_auth)
    click_on 'New Post'

    fill_in 'Body', with: @post.body
    fill_in 'Title', with: @post.title
    click_on 'Create Post'

    assert_text 'Post was successfully created'
    click_on 'Back'
  end

  test 'updating a Post' do
    visit posts_url(@admin_auth)
    click_on 'Edit', match: :first

    fill_in 'Body', with: @post.body
    fill_in 'Title', with: @post.title
    click_on 'Update Post'

    assert_text 'Post was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Post' do
    visit posts_url(@admin_auth)
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed'
  end
end
