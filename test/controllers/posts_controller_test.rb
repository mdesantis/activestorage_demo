require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_headers = admin_auth_headers
    @post = posts(:one)
  end

  teardown do
    FileUtils.rm_r Dir.glob Rails.root.join('tmp', 'storage', '*')
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url, headers: @auth_headers
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      gallery_images = [
        fixture_file_upload('files/image.jpg')
      ]
      post posts_url,
           params: { post: { body: @post.body, title: @post.title, gallery_images: gallery_images } },
           headers: @auth_headers
    end

    post = Post.last

    assert_not_empty post.gallery_images

    assert_redirected_to post_url(post)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post), headers: @auth_headers
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post), params: { post: { body: @post.body, title: @post.title } }, headers: @auth_headers
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post), headers: @auth_headers
    end

    assert_redirected_to posts_url
  end
end
