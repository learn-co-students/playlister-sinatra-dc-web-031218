class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(/\ /,"-")
  end


  def self.find_by_slug(slug)
    name = slug.gsub(/\-/," ")
    Artist.find {|a| a.name.downcase == name.downcase}
  end

end
