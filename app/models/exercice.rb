class Exercice < ApplicationRecord
  belongs_to :user
  has_many :comments through: :users
  has_many :likes through: :users
  has_many :answers

  validates :title, presence: true, uniqueness: true
  validates :beginning_story, presence: true
  validates :end_story, presence: true
  validates :user_id, presence: true
end
