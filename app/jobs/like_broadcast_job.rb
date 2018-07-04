class LikeBroadcastJob < ApplicationJob
    queue_as :default
  
    def perform(like)
      ActionCable.server.broadcast "event_#{like.question.event.id}_channel",
                                   like: like.question.likes.distinct.count('user_id') , question_id: like.question.id
    end
  
  end