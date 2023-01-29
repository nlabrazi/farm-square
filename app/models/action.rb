class Action < ApplicationRecord
  has_many :tasks

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :description, presence: true, length: { maximum: 500 }
end
