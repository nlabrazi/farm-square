class User < ApplicationRecord
  default_scope { order(email: :asc) }

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :articles
  has_many :bookings #,dependent: :destroy

  def self.create_with_password(attr={})
    generated_password = attr[:email] + "123"
    self.create(attr.merge(password: generated_password, password_confirmation: generated_password))
  end

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
