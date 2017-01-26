require('pg')

class Album

  attr_accessor :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{@artist_id}) returning *; "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new( album)}
  end

  def artist_by_album
    sql = "SELECT * FROM artists WHERE id = #{@id};"
    artist = SqlRunner.run(sql)
    result = artist.map {|artist| Artist.new(artist) }
    return result
  end

  def album_by_id
    sql = "SELECT * FROM albums WHERE id = #{@id};"
    SqlRunner.run(sql).first
  end

  def update()
    sql = "UPDATE albums SET (title, genre, artist_id) = ('#{@title}', '#{@genre}', #{@artist_id}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE from albums;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id};"
    SqlRunner.run(sql)
  end
end