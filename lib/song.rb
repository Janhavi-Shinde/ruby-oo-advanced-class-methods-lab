class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  def self.create
    song = self.new
    song.save
    song
      
  end
  def save
    self.class.all << self
  end

  def self.new_by_name(nameparam)
    song = self.new
    song.name = nameparam
    song
  end

  def self.create_by_name(nameparam)
    song = self.new
    song.name = nameparam
    self.all << song
    song
  end

  def self.find_by_name(nameparam)
    
    if @@all.each {|instance| instance.name == nameparam}
      @@all.find{|person| person.name == nameparam}
    else false
    end
  end

  def self.find_or_create_by_name(namestring)
    self.find_by_name(namestring) || self.create_by_name(namestring)
    
  end

  def self.alphabetical
    self.all.sort_by {|instance| instance.name}
  end

  # Taylor Swift - Blank Space.mp3
  def self.new_from_filename(filestring)
    song = self.new
    data_holder = filestring.split("-")
        song.artist_name = data_holder[0].rstrip
        name_holder = data_holder[1].split(".")

    song.name = name_holder[0].strip
    song

  end

  def self.create_from_filename(filestring)
    self.all << self.new_from_filename(filestring)
  end

  def self.destroy_all
    self.all.clear
  end
end
