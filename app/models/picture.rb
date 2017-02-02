class Picture < ApplicationRecord

  validates_presence_of :artist, :url, :title
  validates_uniqueness_of :url
  validates_length_of :title, minimum: 3, too_short: 'please enter at least 3 characters', maximum: 20, too_long: 'please pick a shorter name'

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end
end
