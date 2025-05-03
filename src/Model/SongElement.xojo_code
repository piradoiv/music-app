#tag Class
Protected Class SongElement
	#tag Method, Flags = &h0
		Sub Constructor()
		  AlbumImage = App.GenerateDefaultAlbumImage
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Album As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mAlbumImage
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mAlbumImage = App.GenerateDefaultAlbumImage
			  AlbumImageHash = ""
			  
			  If value <> Nil Then
			    mAlbumImage = Picture.FromData(value.ToData(Picture.Formats.PNG))
			  End If
			  
			  AlbumImageHash = EncodeHex(Crypto.Hash(mAlbumImage.ToData(Picture.Formats.JPEG, Picture.QualityLow), Crypto.HashAlgorithms.MD5))
			End Set
		#tag EndSetter
		AlbumImage As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		AlbumImageHash As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Artist As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAlbumImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		NativePath As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As String
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
			Name="Album"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mAlbumImage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Artist"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NativePath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
