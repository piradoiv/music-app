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
		  
		  Var sql As String = "CREATE TABLE playlist (id INTEGER PRIMARY KEY AUTOINCREMENT, file_path TEXT NOT NULL UNIQUE, sort_order INTEGER NOT NULL, added_at DATETIME DEFAULT CURRENT_TIMESTAMP)"
		  mDatabase.ExecuteSQL(sql)
		  
		  If mDatabase.Error Then
		    Raise New RuntimeException("Failed to create playlist table: " + mDatabase.ErrorMessage)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSong(filePath As String)
		  Var maxOrder As Integer = GetMaxSortOrder() + 1
		  mDatabase.ExecuteSQL("INSERT OR IGNORE INTO playlist (file_path, sort_order) VALUES (?, ?)", filePath, maxOrder)
		  
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
		  Var sql As String = "SELECT file_path FROM playlist ORDER BY sort_order"
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

	#tag Method, Flags = &h21
		Private Function GetMaxSortOrder() As Integer
		  Var sql As String = "SELECT COALESCE(MAX(sort_order), 0) as max_order FROM playlist"
		  Var rs As RowSet = mDatabase.SelectSQL(sql)
		  
		  If mDatabase.Error Then
		    Return 0
		  End If
		  
		  If Not rs.AfterLastRow Then
		    Return rs.Column("max_order").IntegerValue
		  End If
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdatePlaylistOrder(filePaths() As String)
		  mDatabase.ExecuteSQL("BEGIN TRANSACTION")
		  
		  For i As Integer = 0 To filePaths.LastIndex
		    mDatabase.ExecuteSQL("UPDATE playlist SET sort_order = ? WHERE file_path = ?", i, filePaths(i))
		    If mDatabase.Error Then
		      mDatabase.ExecuteSQL("ROLLBACK")
		      Raise New RuntimeException("Failed to update playlist order: " + mDatabase.ErrorMessage)
		    End If
		  Next
		  
		  mDatabase.ExecuteSQL("COMMIT")
		  
		  If mDatabase.Error Then
		    Raise New RuntimeException("Failed to commit playlist order: " + mDatabase.ErrorMessage)
		  End If
		End Sub
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