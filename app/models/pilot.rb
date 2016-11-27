class Pilot < ApplicationRecord
  has_secure_password
  has_one :log_book, dependent: :destroy
  has_many :flights, through: :log_book, dependent: :destroy
  has_many :pilot_ratings, dependent: :delete_all
  has_many :ratings, through: :pilot_ratings
  validates :name, :email, presence: true
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
  validates :password, length: {minimum: 6}, on: :create
  validates :password, confirmation: true, on: :create
  after_create :create_log_book

  def create_log_book
    self.log_book.create
  end

end
