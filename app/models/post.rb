class Post < ApplicationRecord
  has_many_attached :gallery_images

  validates_presence_of :title
end
