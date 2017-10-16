class Picture < ApplicationRecord

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
