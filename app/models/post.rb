class Post < ApplicationRecord
  has_many_attached :gallery_images

  validates_presence_of :title

  def unsaved_gallery_images_attachments
    gallery_images_attachments.select { |attachment| attachment.new_record? && attachment.blob.present? }
  end
end
