class Picture < ApplicationRecord

  validates :artist, :title, :url, presence: { :message => "Avast ye scallewag! Ya need to put somethin' in thar!" }
  validate :url_starts_with_http

  belongs_to :user

  def url_starts_with_http
    return unless url.present?
    url.starts_with?("http")
    errors.add(:url, "must start with http") if not url.starts_with?("http")
  end

  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.created_in_year(year)
    Picture.where("created_at LIKE ?", "%#{ year }%")
  end

  def self.getting_year
    Picture.all.map { |picture| picture.created_at.year }.uniq!
  end
end
