class Question < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :question, presence: true, length: {minimum: 2, maximum: 1000}
  after_create_commit { QuestionBroadcastJob.perform_later(self) }
end
