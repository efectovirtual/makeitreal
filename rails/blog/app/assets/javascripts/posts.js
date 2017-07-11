function PostView () {
  $('.new_post').on('submit', function (event) {
    var title = $(this).find('input[name="title"]').val()
    var content = $(this).find('input[name="content"]').val()
    var isValid = true
    if (title.length === 0 || title.length > 100) {
      isValid = false
    }

    if (content.length === 0 || content.length > 140) {
      isValid = false
    }

    if (!isValid) {
      event.preventDefault()
    }
  })
}
