#tag Class
Protected Class PreferencesStore
	#tag Method, Flags = &h0
		Sub Constructor(file As FolderItem)
		  mPreferences = New JSONItem
		  If file <> Nil Then
		    mFile = New FolderItem(file)
		  End If
		  
		  mSaveChangesTimer = New Timer
		  AddHandler mSaveChangesTimer.Action, WeakAddressOf PersistChangesHandler
		  mSaveChangesTimer.Period = 1000
		  mSaveChangesTimer.RunMode = Timer.RunModes.Off
		  
		  If file = Nil Or Not file.Exists Or Not file.IsReadable Then
		    Return
		  End If
		  
		  Var reader As TextInputStream = TextInputStream.Open(file)
		  Var contents As String = reader.ReadAll(Encodings.UTF8)
		  reader.Close
		  mPreferences = New JSONItem(contents)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(key As String) As Variant
		  Return mPreferences.Value(key)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(key As String, default As Variant) As Variant
		  Return mPreferences.Lookup(key, default)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PersistChangesHandler(sender As Timer)
		  If mFile.Exists Then
		    mFile.Remove
		  End If
		  
		  Var writer As TextOutputStream = TextOutputStream.Open(mFile)
		  writer.Write(mPreferences.ToString)
		  writer.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(key As String)
		  If mPreferences.HasKey(key) Then
		    mPreferences.Remove(key)
		  End If
		  
		  Save
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Save()
		  mSaveChangesTimer.RunMode = Timer.RunModes.Single
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set(key As String, value As Variant)
		  mPreferences.Value(key) = value
		  Save
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPreferences As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSaveChangesTimer As Timer
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
		#tag ViewProperty
			Name="mPreferences"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
