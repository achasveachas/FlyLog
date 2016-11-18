class Pilot < ApplicationRecord
  has_secure_password
  has_many :log_books
  has_many :flights, through: :log_book
  has_many :pilot_ratings
  has_many :ratings, through: :pilot_ratings
  validates :name, :email, presence: true
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
  validates :password, length: {minimum: 6}, on: :create
  validates :password, confirmation: true, on: :create
  after_create :create_log_book

  def create_log_book
    self.log_books.create
  end

end
