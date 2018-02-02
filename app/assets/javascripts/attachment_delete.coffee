$(document).on 'turbolinks:load', ->
  $('.delete_attachment').on('ajax:success', (data, status, xhr) ->
    $(@).closest('.attachment').remove()
    blobId = $(@).data('blob-id')
    $(".post_gallery_images_attachment[data-blob-id=#{blobId}]").remove()
  ).on('ajax:error', (xhr, status, error) ->
    console.error @, xhr, status, error
  )
