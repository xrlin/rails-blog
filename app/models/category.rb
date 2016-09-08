class Category < ApplicationRecord
  include Slug
  validates :name, presence: true, allow_blank?: false

  has_many :posts
end
