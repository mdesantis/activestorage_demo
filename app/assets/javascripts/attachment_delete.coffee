$(document).ready ->
  $('.delete_attachment').on('ajax:success', (data, status, xhr) ->
    $(@).closest('.attachment').remove()
  ).on('ajax:error', (xhr, status, error) ->
    console.error @, xhr, status, error
  )
