class Task < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_many :bookings

  belongs_to :action
  belongs_to :farm

  validates :title, presence: true, length: { minimum: 3, maximum: 20 }
  validates :description, length: { maximum: 500 }
  validates :participant_number, presence: true, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :search_by_title,
  against: :title, using: {
    tsearch: { prefix: true }
  }
  pg_search_scope :search_by_city,
  against: :farm_id
  
end
