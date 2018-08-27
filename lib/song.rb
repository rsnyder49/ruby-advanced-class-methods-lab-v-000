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
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song 
  end
  
  def self.create_by_name(song_name)
    song = self.create 
    song.name = song_name
    song 
  end
    
  def self.find_by_name(song_name)
    self.all.find{|name| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end 
  
  def self.alphabetical 
    self.all.sort
  end
  
  def self.new_from_filename(song_from_file) 
    song = song_from_file.split("-")
    artist_name = song[0]
    song_name = song[1].split(".")
    
    new_song = self.new
    new_song.artist_name = artist_name 
    new_song.song_name = song_name 
    new_song
  end
    

end
