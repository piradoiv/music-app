#tag Class
Protected Class MusicApp
	#tag Method, Flags = &h0
		Sub AddFiles(files() As FolderItem)
		  Var newPaths() As String
		  
		  For Each musicFile As FolderItem In files
		    If Not IsMusicFile(musicFile) Then
		      Continue
		    End If
		    
		    If mPlaylistDatabase <> Nil Then
		      Try
		        mPlaylistDatabase.AddSong(musicFile.NativePath)
		        newPaths.Add(musicFile.NativePath)
		      Catch ex As RuntimeException
		        System.DebugLog("Failed to add song: " + ex.Message)
		      End Try
		    Else
		      newPaths.Add(musicFile.NativePath)
		    End If
		  Next
		  
		  If newPaths.Count > 0 Then
		    newPaths.Sort
		    RaiseEvent NewFilesAdded(newPaths)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFolderRecursively(folder As FolderItem)
		  Var musicFiles() As FolderItem
		  FindMusicRecursively(folder, musicFiles)
		  
		  AddFiles(musicFiles)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AlbumImage(songNativePath As String) As Picture
		  Var songFile As New FolderItem(songNativePath, FolderItem.PathModes.Native)
		  If Not IsMusicFile(songFile) Then
		    Return Nil
		  End If
		  
		  // First try to get the ID3 tags
		  Var reader As TextInputStream = TextInputStream.Open(songFile)
		  Var songData As MemoryBlock = reader.ReadAll
		  reader.Close
		  Var tags As Dictionary = ReadID3Tags(songData)
		  If tags.HasKey("APIC") Then
		    Return tags.Value("APIC")
		  End If
		  
		  // Try with to find an album picture if ID3 tags didn't contain images
		  Var parentFolder As FolderItem = songFile.Parent
		  Var pictures() As FolderItem
		  For Each child As FolderItem In parentFolder.Children
		    If child.Extension = "jpg" Or child.Extension = "png" Then
		      pictures.Add(child)
		      Exit
		    End If
		  Next
		  
		  If pictures.Count = 1 Then
		    Return Picture.Open(pictures(0))
		  End If
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  InitializeDatabaseAndLoadPlaylist
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FindMusicRecursively(folder As FolderItem, result() As FolderItem)
		  For Each child As FolderItem In folder.Children
		    If child.IsFolder Then
		      FindMusicRecursively(child, result)
		      Continue
		    End If
		    
		    If Not IsMusicFile(child) Then
		      Continue
		    End If
		    
		    result.Add(child)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPlaylist() As String()
		  If mPlaylistDatabase = Nil Then
		    Var empty() As String
		    Return empty
		  End If
		  
		  Try
		    Return mPlaylistDatabase.GetAllSongs
		  Catch ex As RuntimeException
		    System.DebugLog("Failed to get playlist: " + ex.Message)
		    Var empty() As String
		    Return empty
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsMusicFile(file As FolderItem) As Boolean
		  Var extensions() As String = Array("mp3", "m4a")
		  Return file <> Nil And extensions.IndexOf(file.Extension) >= 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InitializeDatabaseAndLoadPlaylist()
		  Try
		    Var appFolder As FolderItem = SpecialFolder.ApplicationData.Child("es.rcruz.music")
		    If Not appFolder.Exists Then
		      appFolder.CreateFolder
		    End If
		    
		    Var databaseFile As FolderItem = appFolder.Child("playlist.db")
		    mPlaylistDatabase = New PlaylistDatabase(databaseFile)
		    
		    LoadPlaylistFromDatabase
		    
		  Catch ex As RuntimeException
		    // If database initialization fails, continue without persistence
		    System.DebugLog("Failed to initialize playlist database: " + ex.Message)
		    mPlaylistDatabase = Nil
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadPlaylistFromDatabase()
		  If mPlaylistDatabase = Nil Then
		    Return
		  End If
		  
		  Try
		    Var playlistPaths() As String = mPlaylistDatabase.GetAllSongs
		    
		    For Each path As String In playlistPaths
		      Var musicFile As New FolderItem(path, FolderItem.PathModes.Native)
		      If Not musicFile.Exists Or Not IsMusicFile(musicFile) Then
		        mPlaylistDatabase.RemoveSong(path)
		      End If
		    Next
		    
		  Catch ex As RuntimeException
		    System.DebugLog("Failed to load playlist from database: " + ex.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSong(songPath As FolderItem)
		  If mPlaylistDatabase <> Nil Then
		    Try
		      mPlaylistDatabase.RemoveSong(songPath.NativePath)
		      RaiseEvent SongRemoved(songPath.NativePath)
		    Catch ex As RuntimeException
		      System.DebugLog("Failed to remove song from database: " + ex.Message)
		    End Try
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdatePlaylistOrder(filePaths() As String)
		  If mPlaylistDatabase <> Nil Then
		    Try
		      mPlaylistDatabase.UpdatePlaylistOrder(filePaths)
		    Catch ex As RuntimeException
		      System.DebugLog("Failed to update playlist order: " + ex.Message)
		    End Try
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event NewFilesAdded(nativePaths() As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SongRemoved(nativePath As String)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mPlaylistDatabase As PlaylistDatabase
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
