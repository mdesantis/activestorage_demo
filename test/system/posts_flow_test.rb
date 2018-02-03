require 'application_system_test_case'

class PostsFlowTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'visiting the index' do
    visit posts_url
    assert_selector 'h1', text: 'Listing posts'
  end

  test 'creating a Post' do
    visit posts_url
    click_on 'New Post'

    fill_in 'Body', with: @post.body
    fill_in 'Title', with: @post.title
    attach_file 'post[gallery_images][]', [image_path, image_path]
    click_on 'Create Post'

    assert_text 'Post was successfully created'
    assert_text 'image.jpg', count: 2
    click_on 'Back'
  end

  test 'updating a Post' do
    visit posts_url
    click_on 'Edit', match: :first

    fill_in 'Body', with: @post.body
    fill_in 'Title', with: @post.title
    attach_file 'post[gallery_images][]', [image_path, image_path]
    click_on 'Update Post'

    assert_text 'Post was successfully updated'
    assert_text 'image.jpg', count: 2

    click_on 'Back'
  end

  test 'deleting Post gallery images' do
    post = posts :with_gallery_images_one

    visit edit_post_url(post)

    assert_text 'image.jpg'

    page.accept_confirm do
      click_on '[×]', match: :first
    end

    assert_no_text 'image.jpg'
    click_on 'Back'
  end

  test 'deleting unsaved Post gallery images' do
    visit new_post_url

    attach_file 'post[gallery_images][]', [image_path]

    click_on 'Create Post'

    page.accept_confirm do
      click_on '[×]', match: :first
    end

    click_on 'Create Post'

    assert_no_text 'image.jpg'

    click_on 'Back'
  end

  test 'destroying a Post' do
    visit posts_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed'
  end

  def image_path
    File.join fixture_path, 'files/image.jpg'
  end
end
