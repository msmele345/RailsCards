class User < ApplicationRecord

  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :played_decks, through: :rounds, source: :deck

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  has_secure_password

end
