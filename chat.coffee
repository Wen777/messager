@History = new Mongo.Collection "history"

if Meteor.isServer
  if not History.findOne()
    record1 =
      "message" : "I am hungry."
      "Author" : "dada"
    record2 =
      "message" : "I am hungry."
      "Author" : "GG"

    History.insert record1
    History.insert record2

if Meteor.isClient
  Template.chatbox.helpers
    messages: ->
      History.find()

  Template.videobox.rendered = ->

    comm = new Icecomm '3kB4PpZaNNFN4r3xhmOVgcPn2D8rzcOTtQFh4gRwmAsaGTPwlm'

    comm.connect 'custom room', {audio: false}

    comm.on('connected', (peer) ->
       document.body.appendChild peer.getVideo()
    )

    comm.on('local', (peer)->
      localVideo.src = peer.stream
    )

    comm.on('disconnect', (peer)->
      document.getElementById(peer.ID).remove()
    )
