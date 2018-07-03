class EventChannel < ApplicationCable::Channel
    def subscribed
      stream_from "event_#{params['event_id']}_channel"
    end
  
    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
  
    def send_question(data)
        current_user.questions.create!(question: data['question'], event_id: data['event_id'])
    end
  end