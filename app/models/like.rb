class Like < ApplicationRecord
  belongs_to :user
  belongs_to :question
  after_create_commit { LikeBroadcastJob.perform_later(self) }
end
