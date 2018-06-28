require 'pry'
class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end


  #find pokemon in database by their id number
  #return new pokemon object
  def self.find(id, db)
    #binding.pry
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id:pokemon_info[0], name:pokemon_info[1], type:pokemon_info[2], db:db)
  end
end
