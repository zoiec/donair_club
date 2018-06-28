App.review = App.cable.subscriptions.create "ReviewChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#reviews').append(data)

  submit: (data) ->
    @perform 'submit', data: data
