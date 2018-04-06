class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist


  def slug
    self.name.downcase.gsub(/\ /,"-")
  end


  def self.find_by_slug(slug)
    name = slug.gsub(/\-/," ")
    Song.find {|s| s.name.downcase == name.downcase}
  end


end
