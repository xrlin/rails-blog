class Post < ApplicationRecord
  acts_as_taggable
  include Sluggable

  validates :title, presence: true, allow_blank?: false

  belongs_to :category
end
