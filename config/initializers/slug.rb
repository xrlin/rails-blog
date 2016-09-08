module Slug
  extend ActiveSupport::Concern

  included do
    before_save :set_slug

    def self.find_by_slug_or_id(attr)
      find_by_slug(attr) || find(attr)
    end

    def self.find_by_slug(attr)
      find_by(slug: attr)
    end

  end

  def set_slug
    title = self.try(:title) || self.try(:name)
    self.slug = Pinyin.t(title.downcase, splitter: '-') unless title.blank?
  end

  def to_param
    slug || id.to_s
  end

end
