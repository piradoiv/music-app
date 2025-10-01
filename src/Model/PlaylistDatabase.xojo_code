#tag Class
Protected Class PlaylistDatabase
	#tag Method, Flags = &h0
		Sub Constructor(databaseFile As FolderItem)
		  mDatabase = New SQLiteDatabase
		  mDatabase.DatabaseFile = databaseFile
		  
		  If Not databaseFile.Exists Then
		    CreateDatabase
		  Else
		    If Not mDatabase.Connect Then
		      Raise New RuntimeException("Failed to connect to playlist database: " + mDatabase.ErrorMessage)
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateDatabase()
		  mDatabase.CreateDatabase
		  
		  Var sql As String = "CREATE TABLE playlist (id INTEGER PRIMARY KEY AUTOINCREMENT, file_path TEXT NOT NULL UNIQUE, added_at DATETIME DEFAULT CURRENT_TIMESTAMP)"
		  mDatabase.ExecuteSQL(sql)
		  
		  If mDatabase.Error Then
		    Raise New RuntimeException("Failed to create playlist table: " + mDatabase.ErrorMessage)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSong(filePath As String)
		  mDatabase.ExecuteSQL("INSERT OR IGNORE INTO playlist (file_path) VALUES (?)", filePath)
		  
		  If mDatabase.Error And mDatabase.ErrorCode <> 19 Then
		    Raise New RuntimeException("Failed to add song to playlist: " + mDatabase.ErrorMessage)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSong(filePath As String)
		  mDatabase.ExecuteSQL("DELETE FROM playlist WHERE file_path = ?", filePath)
		  
		  If mDatabase.Error Then
		    Raise New RuntimeException("Failed to remove song from playlist: " + mDatabase.ErrorMessage)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllSongs() As String()
		  Var songs() As String
		  Var sql As String = "SELECT file_path FROM playlist ORDER BY added_at"
		  Var rs As RowSet = mDatabase.SelectSQL(sql)
		  
		  If mDatabase.Error Then
		    Raise New RuntimeException("Failed to retrieve playlist: " + mDatabase.ErrorMessage)
		  End If
		  
		  While Not rs.AfterLastRow
		    songs.Add(rs.Column("file_path").StringValue)
		    rs.MoveToNextRow
		  Wend
		  
		  Return songs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearPlaylist()
		  mDatabase.ExecuteSQL("DELETE FROM playlist")
		  
		  If mDatabase.Error Then
		    Raise New RuntimeException("Failed to clear playlist: " + mDatabase.ErrorMessage)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SongCount() As Integer
		  Var sql As String = "SELECT COUNT(*) as count FROM playlist"
		  Var rs As RowSet = mDatabase.SelectSQL(sql)
		  
		  If mDatabase.Error Then
		    Raise New RuntimeException("Failed to get song count: " + mDatabase.ErrorMessage)
		  End If
		  
		  If Not rs.AfterLastRow Then
		    Return rs.Column("count").IntegerValue
		  End If
		  
		  Return 0
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mDatabase As SQLiteDatabase
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass