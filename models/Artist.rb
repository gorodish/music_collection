require('pg')
require_relative('../db/sqlrunner')

class Artist

  attr_accessor :name, :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') returning *; "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map {|artist| Artist.new( artist)}
  end
  
  def albums_by_artist
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    artist_albums = SqlRunner.run(sql)
    result = artist_albums.map {|album| Album.new(album) }
    return result
  end

  def update()
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE from artists;"
    SqlRunner.run(sql)
  end

end