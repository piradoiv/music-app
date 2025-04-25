#tag Class
Protected Class GenreRepository
Inherits MusicLibrary.Repositories.Repository
	#tag Method, Flags = &h0
		Function GetAll() As MusicLibrary.Entities.Genre()
		  Const sql = "SELECT * FROM genres"
		  
		  Var result() As MusicLibrary.Entities.Genre
		  
		  Var rows As RowSet = DB.SelectSQL(sql)
		  For Each row As DatabaseRow In rows
		    Var genre As New MusicLibrary.Entities.Genre
		    genre.Id = row.Column("id").IntegerValue
		    genre.Name = row.Column("name").StringValue
		    result.Add(genre)
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(genre As MusicLibrary.Entities.Genre)
		  Const insertSql = "INSERT INTO genres (name) VALUES (?)"
		  Const updateSql = "UPDATE genres SET name = ? WHERE id = ?"
		  
		  If genre.Id <= 0 Then
		    DB.ExecuteSQL(insertSql, genre.Name)
		  Else
		    DB.ExecuteSQL(updateSql, genre.Name, genre.Id)
		  End If
		End Sub
	#tag EndMethod


End Class
#tag EndClass
