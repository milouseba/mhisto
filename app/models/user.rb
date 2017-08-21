class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :exercices
has_many :comments
has_many :likes
has_many :answers


validates :first_name, presence: true, uniqueness: true
validates :last_name, presence: true, uniqueness: true
validates :username, presence: true, uniqueness: true
validates :level, presence: true
end
