class Task < ApplicationRecord
  MAX_TITLE_LENGTH = 125
  VALID_TITLE_REGEX = /\A.*[a-zA-Z0-9].*\z/i

  validates :title,
    presence: true,
    length: { maximum: MAX_TITLE_LENGTH },
    format: { with: VALID_TITLE_REGEX }
  validates :slug, uniqueness: true
  validate :slug_not_changed
  before_create :set_slug

  private

  def set_slug
    title_slug = title.parameterize
    count = Task.where("slug Like?","#{title_slug}%").size
    slug_candidate = count.positive?  ? "#{title_slug}-#{count+1}" : title_slug
    self.slug = slug_candidate
  end

  def slug_not_changed
    if slug_changed? && self.persisted?
      errors.add(:slug, 'is immutable!')
    end
  end
end