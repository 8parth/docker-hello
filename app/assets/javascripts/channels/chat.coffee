App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    console.log('Connected')

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log("data received: " +data)
