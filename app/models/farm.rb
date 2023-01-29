class Farm < ApplicationRecord
  belongs_to :city
  has_many :tasks

  validates :name, presence: true, length: { minimum: 3, maximum: 50}
  validates :address, presence: true, length: { minimum: 3, maximum: 50}
end
