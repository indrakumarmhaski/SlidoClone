jQuery(document).on 'turbolinks:load', ->
  questions = $('#questions')
  if $('#questions').length > 0
    questions_to_bottom = -> questions.scrollTop(questions.prop("scrollHeight"))
    questions_to_bottom()
    App.global_chat = App.cable.subscriptions.create {
        channel: "EventChannel"
        event_id: questions.data('event-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        if data['question']
          questions.append data['question']
          questions_to_bottom()
        else if data['like']
          $("#question-#{data['question_id']}").html(data['like'] + " Likes")
        

      send_question: (question, event_id) ->
        @perform 'send_question', question: question, event_id: event_id
      
      send_like: ( question_id ) ->
        @perform 'send_like', question_id: question_id

      $('#new_question').submit (e) ->
            $this = $(this)
            textarea = $this.find('#question_question')
            if $.trim(textarea.val()).length > 1
                App.global_chat.send_question textarea.val(), questions.data('event-id')
                textarea.val('')
            e.preventDefault()
            return false
      
      $('.new_like').submit (f) ->
            $this = $(this)
            btn = $this.find('.btn')
            btn.addClass("disabled")
            btn.attr("disabled", true)
            App.global_chat.send_like this.id
            f.preventDefault()
            return false