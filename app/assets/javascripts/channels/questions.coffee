jQuery(document).on 'turbolinks:load', ->
  questions = $('#questions')
  if $('#questions').length > 0

    App.global_chat = App.cable.subscriptions.create {
        channel: "EventChannel"
        event_id: questions.data('event-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        questions.append data['question']

      send_question: (question, event_id) ->
        @perform 'send_question', question: question, event_id: event_id

      $('#new_question').submit (e) ->
            $this = $(this)
            textarea = $this.find('#question_question')
            if $.trim(textarea.val()).length > 1
                App.global_chat.send_question textarea.val(), questions.data('event-id')
                textarea.val('')
            e.preventDefault()
            return false