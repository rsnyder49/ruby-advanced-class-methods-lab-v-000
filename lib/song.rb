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
    self.all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end 
  
  def self.alphabetical 
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename) 
    song = filename.split(" - ")
    artist_name = song[0]
    song_name, ext = song[1].split(".")
    
    new_song = self.new
    new_song.artist_name = artist_name 
    new_song.song_name = song_name 
    new_song
  end
  
  def self.create_from_filename(filename) 
    song = filename.split(" - ")
    artist_name = song[0]
    song_name = song[1].split(".")
    name = song_name[0]
    dot_mp3 = song_name[1]
    
    new_song = self.create 
    new_song.artist_name = artist_name 
    new_song.song_name = song_name 
    new_song 
  end
  
  def self.destroy_all 
    self.all.clear 
  end

end
