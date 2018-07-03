class QuestionBroadcastJob < ApplicationJob
    queue_as :default
  
    def perform(question)
      ActionCable.server.broadcast "event_#{question.event.id}_channel",
                                   question: render_question(question)
    end
  
    private
  
    def render_question(question)
      QuestionsController.render partial: 'questions/question', locals: {question: question}
    end
  end