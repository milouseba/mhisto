class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :exercice

  has_many :comments
  has_many :likes
  validates :content, presence: true

  acts_as_votable
end
