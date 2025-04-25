#tag Module
Protected Module MusicLibrary
	#tag Method, Flags = &h21
		Private Function DecodeSynchsafe(mb As MemoryBlock) As Integer
		  Var result As Integer = 0
		  result = BitOr(result, BitAnd(mb.Byte(0), &h7F) * (2 ^ 21))
		  result = BitOr(result, BitAnd(mb.Byte(1), &h7F) * (2 ^ 14))
		  result = BitOr(result, BitAnd(mb.Byte(2), &h7F) * (2 ^ 7))
		  result = BitOr(result, (BitAnd(mb.Byte(3), &h7F)))
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DecodeText(content As String) As String
		  If content.Length = 0 Then
		    Return ""
		  End If
		  
		  Var encodingByte As Integer = Asc(content.Middle(0, 1))
		  
		  Return content.Middle(1).DefineEncoding(GetEncoding(encodingByte))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetEncoding(encodingByte As Integer) As TextEncoding
		  Var textEncodings() As TextEncoding = Array(Encodings.ISOLatin1, Encodings.UTF16, Encodings.UTF16BE)
		  If encodingByte >= 0 And encodingByte <= 2 Then
		    Return textEncodings(encodingByte)
		  End If
		  
		  Return Encodings.UTF8
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadID3Tags(fileData As MemoryBlock) As Dictionary
		  If fileData = Nil Or fileData.Size < 10 Then
		    Return Nil
		  End If
		  
		  Var tags As New Dictionary
		  
		  Var header As New MemoryBlock(10)
		  header.StringValue(0, 10) = fileData.StringValue(0, 10)
		  
		  If header.StringValue(0, 3) <> "ID3" Then
		    Return tags
		  End If
		  
		  Var sizeBytes As New MemoryBlock(4)
		  sizeBytes.LittleEndian = False
		  sizeBytes.StringValue(0, 4) = header.StringValue(6, 4)
		  Var tagSize As Integer = DecodeSynchsafe(sizeBytes)
		  
		  If fileData.Size < 10 + tagSize Then
		    Return tags
		  End If
		  
		  Var tagData As New MemoryBlock(tagSize)
		  tagData.StringValue(0, tagSize) = fileData.StringValue(10, tagSize)
		  
		  Var offset As Integer = 0
		  While offset < tagSize - 10
		    Var frameID As String = tagData.StringValue(offset, 4)
		    If frameID = Chr(0) + Chr(0) + Chr(0) + Chr(0) Then
		      Exit
		    End If
		    
		    Var frameSizeBytes As New MemoryBlock(4)
		    frameSizeBytes.StringValue(0, 4) = tagData.StringValue(offset + 4, 4)
		    Var frameSize As Integer = DecodeSynchsafe(frameSizeBytes)
		    
		    If frameSize <= 0 Or offset + 10 + frameSize > tagSize Then
		      Exit
		    End If
		    
		    Var contentOffset As Integer = offset + 10
		    Var content As New MemoryBlock(frameSize)
		    content.StringValue(0, frameSize) = tagData.StringValue(contentOffset, frameSize)
		    
		    If frameID = "APIC" Then
		      Var pos As Integer = 0
		      Var encodingByte As Integer = content.Byte(pos)
		      pos = pos + 1
		      
		      Var mimeEnd As Integer = content.StringValue(pos, frameSize - pos).IndexOf(Chr(0))
		      If mimeEnd = -1 Then mimeEnd = frameSize - pos
		      Var mimeType As String = content.StringValue(pos, mimeEnd)
		      pos = pos + mimeEnd + 1
		      
		      Var pictureType As Integer = content.Byte(pos)
		      pos = pos + 1
		      
		      Var descEnd As Integer = content.StringValue(pos, frameSize - pos).IndexOf(Chr(0))
		      If encodingByte = 1 Or encodingByte = 2 Then
		        descEnd = content.StringValue(pos, frameSize - pos).IndexOf(Chr(0) + Chr(0))
		        If descEnd <> -1 Then descEnd = descEnd + 1
		      End If
		      If descEnd = -1 Then descEnd = frameSize - pos
		      Var description As String = content.StringValue(pos, descEnd).DefineEncoding(GetEncoding(encodingByte))
		      pos = pos + descEnd + 1
		      
		      Var pictureDataSize As Integer = frameSize - pos
		      
		      If pictureDataSize > 0 Then
		        Var scanStart As Integer = contentOffset + pos
		        Var maxSize As Integer = Min(tagSize - scanStart, 1048576) // Cap at 1 MB
		        For i As Integer = scanStart To scanStart + maxSize - 2
		          If tagData.Byte(i) = &hFF And tagData.Byte(i + 1) = &hD9 Then
		            pictureDataSize = i + 2 - scanStart
		            Exit
		          End If
		        Next
		        
		        Var pictureData As New MemoryBlock(pictureDataSize)
		        pictureData.StringValue(0, pictureDataSize) = tagData.StringValue(contentOffset + pos, pictureDataSize)
		        
		        Var pic As Picture
		        Try
		          pic = Picture.FromData(pictureData)
		          If pic <> Nil Then
		            tags.Value("APIC") = pic
		            tags.Value("APIC_MIME") = mimeType
		            tags.Value("APIC_Type") = pictureType
		            tags.Value("APIC_Description") = description
		          End If
		        Catch e As IOException
		          // Silently ignore corrupt image (:
		        End Try
		      End If
		    Else
		      tags.Value(frameID) = DecodeText(content.StringValue(0, frameSize))
		    End If
		    
		    offset = offset + 10 + frameSize
		  Wend
		  
		  Return tags
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
