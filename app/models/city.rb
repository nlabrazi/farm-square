class City < ApplicationRecord
  has_many :farms

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
end
