class BlobsController < ApplicationController
  def destroy
    if (blob = ActiveStorage::Blob.find_signed(params[:signed_id]))
      if (attachments = blob.attachments).present?
        # attachments deletion delete the blob too, so there's no need to destroy the blob here
        attachments.each(&:purge_later)
      else
        blob.purge_later
      end

      head :no_content
    else
      head :not_found
    end
  end
end
