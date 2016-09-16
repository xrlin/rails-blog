class Category < ApplicationRecord
  include Sluggable
  validates :name, presence: true, allow_blank?: false, uniqueness: true

  has_many :posts
end
