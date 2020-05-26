class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name) 
    song = self.new 
    song.name = name
    @@all << song
    song 
  end   
  
  def self.find_by_name(name)
    @@all.find{|s| s.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil 
      self.create_by_name(name)
    else 
      self.find_by_name(name)
    end 
  end
  
  def self.alphabetical()
    @@all.sort_by{|s| s.name}
  end 
  
  def self.new_from_filename(name)
    data = name.sub!(/.mp3/, "").split(" - ")
    song = self.new 
    song.artist_name = data[0]
    song.name = data[1]
    song  
  end 
  
  def self.create_from_filename(name)
    data = name.sub!(/.mp3/, "").split(" - ")
    song = self.create  
    song.artist_name = data[0]
    song.name = data[1]
    song  
  end
  
  def self.destroy_all
    self.all.clear
  end 
end
