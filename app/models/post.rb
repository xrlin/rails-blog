class Post < ApplicationRecord
  validates :title, presence: true, allow_blank?: false

  belongs_to :category
end
