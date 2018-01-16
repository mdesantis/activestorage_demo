class BlobsController < ApplicationController
  def destroy
    if (blob = ActiveStorage::Blob.find_signed(params[:signed_id]))
      destroy_blob_and_associated_attachments blob
      head :no_content
    else
      head :not_found
    end
  end

  private

  def destroy_blob_and_associated_attachments(blob)
    if (attachments = blob.attachments).present?
      # attachments deletion delete the blob too, so there's no need to destroy the blob here
      attachments.each(&:purge_later)
    else
      blob.purge_later
    end
  end
end
