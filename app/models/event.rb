class Event < ApplicationRecord
    belongs_to :user
    validates :name, :join_code, presence: true
    validates :name, :join_code, uniqueness: true
    validates :join_code, length: { minimum: 5 }
end
