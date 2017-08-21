class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :exercice


  validates :content, presence: true
end
