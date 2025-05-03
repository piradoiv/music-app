#tag DesktopWindow
Begin DesktopContainer SongListContainer
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   300
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   300
   Begin DesktopListBox SongListBox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   True
      Bold            =   False
      ColumnCount     =   5
      ColumnWidths    =   "50,*,120,75,40"
      DefaultRowHeight=   48
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   False
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   300
      Index           =   -2147483648
      InitialValue    =   " 	Title	Album	Artist	 "
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   1
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   300
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Timer UpdateTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   30
      RunMode         =   2
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin Thread ImportMusicThread
      DebugIdentifier =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   2
      StackSize       =   0
      TabPanelIndex   =   0
      ThreadID        =   0
      ThreadState     =   0
      Type            =   1
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  mDrawingCache = New Dictionary
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddSongs(nativePaths() As String)
		  If ImportMusicThread.ThreadState = Thread.ThreadStates.Running Then
		    ImportMusicThread.Stop
		  End If
		  
		  For Each path As String In nativePaths
		    Var f As New FolderItem(path, FolderItem.PathModes.Native)
		    If f = Nil Or Not f.Exists Then
		      Continue
		    End If
		    
		    SongListBox.AddRow("", f.NativePath, "", "", "")
		    Var song As New SongElement
		    song.NativePath = f.NativePath
		    song.Title = song.NativePath
		    SongListBox.RowTagAt(SongListBox.LastAddedRowIndex) = song
		    mPendingToScanSongs.Add(f.NativePath)
		  Next
		  
		  ImportMusicThread.Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CurrentSongRow() As Integer
		  For row As Integer = 0 To SongListBox.LastRowIndex
		    Var tag As SongElement = SongElement(SongListBox.RowTagAt(row))
		    If tag.NativePath = mSongPlaying Then
		      Return row
		    End If
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoDrawAlbumIcon(song As SongElement, g As Graphics)
		  Const padding = 5
		  Const radius = 8
		  
		  g.AntiAliased = True
		  g.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		  
		  Var resizedPic As Picture
		  
		  Var key As String = song.AlbumImageHash
		  
		  If Not mDrawingCache.HasKey(key) Then
		    Var picWidth As Double = g.Width - padding * 2
		    Var picHeight As Double = g.Height - padding * 2
		    
		    Var p As Picture = song.AlbumImage
		    resizedPic = New Picture(picWidth, picHeight, 32)
		    Var gg As Graphics = resizedPic.Graphics
		    gg.AntiAliased = True
		    gg.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		    
		    Var mask As New Picture(resizedPic.Width, resizedPic.Height, 32)
		    mask.Graphics.DrawingColor = Color.Black
		    mask.Graphics.FillRoundRectangle(0, 0, mask.Width, mask.Height, 10, 10)
		    resizedPic.ApplyMask(mask)
		    
		    gg.DrawingColor = Color.RGB(0, 0, 0, 200)
		    gg.DrawRoundRectangle(padding, padding, g.Width - padding * 2, g.Height - padding * 2, radius, radius)
		    
		    gg.DrawPicture(p, 0, 0, gg.Width, gg.Height, 0, 0, p.Width, p.Height)
		    
		    mDrawingCache.Value(key) = resizedPic
		  End If
		  
		  resizedPic = mDrawingCache.Value(key)
		  g.DrawPicture(resizedPic, padding, padding, g.Width, g.Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextSongNativePath() As String
		  Var row As Integer = CurrentSongRow
		  If row < SongListBox.LastRowIndex Then
		    Return SongElement(SongListBox.RowTagAt(row + 1)).NativePath
		  End If
		  
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play(nativePath As String)
		  mSongPlaying = nativePath
		  ResetPlayingIndicator
		  UpdateTimer.RunMode = Timer.RunModes.Multiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreviousSongNativePath() As String
		  Var row As Integer = CurrentSongRow
		  If row > 0 Then
		    Return SongElement(SongListBox.RowTagAt(row - 1)).NativePath
		  End If
		  
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetPlayingIndicator()
		  For i As Integer = 0 To SongListBox.LastRowIndex
		    SongListBox.RefreshCell(i, 4)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  mSongPlaying = ""
		  ResetPlayingIndicator
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event RemoveSong(nativePath As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SongDoublePressed(nativePath As String)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mDrawingCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPendingToScanSongs() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSongPlaying As String
	#tag EndProperty


#tag EndWindowCode

#tag Events SongListBox
	#tag Event
		Function PaintCellText(g as Graphics, row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  Const padding = 2
		  Const radius = 8
		  
		  Select Case column
		  Case 0
		    Var song As SongElement = SongElement(Me.RowTagAt(row))
		    Var albumImage As Picture
		    If song.AlbumImage = Nil Then
		      albumImage = App.GenerateDefaultAlbumImage
		    Else
		      albumImage = song.AlbumImage
		    End If
		    
		    DoDrawAlbumIcon(song, g)
		    
		    Return True
		    
		  Case 4
		    Var song As SongElement = SongElement(Me.RowTagAt(row))
		    If song.NativePath <> mSongPlaying Then
		      Return False
		    End If
		    
		    Var w As Double = g.Width / 3
		    
		    g.SaveState
		    Static highlight As Color = Color.HighlightColor
		    g.DrawingColor = Color.HSV(highlight.Hue, 1, .6)
		    Var now As DateTime = DateTime.Now // TODO: Use System.Ticks instead, or something that consumes less CPU
		    
		    For i As Integer = 0 To 2
		      Var h As Double = Sin((now.SecondsFrom1970 + i * .6) * 10) * g.Height * .75
		      Var bar As New GraphicsPath
		      bar.AddRectangle(i * w, g.Height - h, w - padding, h)
		      g.FillPath(bar)
		    Next
		    
		    g.RestoreState
		    
		    Return True
		    
		  End Select
		  
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub DoublePressed()
		  If Me.SelectedRowIndex = -1 Then
		    Return
		  End If
		  
		  Var song As SongElement = SongElement(Me.RowTagAt(Me.SelectedRowIndex))
		  If song <> Nil Then
		    mSongPlaying = song.NativePath
		    ResetPlayingIndicator
		    RaiseEvent SongDoublePressed(song.NativePath)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  Return Me.SelectedRowIndex <> -1 And Asc(key) = 8
		End Function
	#tag EndEvent
	#tag Event
		Sub KeyUp(key As String)
		  Select Case Asc(key)
		  Case 8
		    For row As Integer = Me.LastRowIndex DownTo 0
		      If Not Me.RowSelectedAt(row) Then
		        Continue
		      End If
		      Var song As SongElement = Me.RowTagAt(row)
		      Me.RemoveRowAt(row)
		      RaiseEvent RemoveSong(song.NativePath)
		    Next
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Function DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean
		  ResetPlayingIndicator
		End Function
	#tag EndEvent
	#tag Event
		Function PaintCellBackground(g As Graphics, row As Integer, column As Integer) As Boolean
		  If Color.IsDarkMode Then
		    g.DrawingColor = If(row Mod 2 = 0, &c121212, &c000000)
		  Else
		    g.DrawingColor = If(row Mod 2 = 0, &cF3F3F3, &cFFFFFF)
		  End If
		  
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.HasVerticalScrollbar = False
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  Var count As Integer = Me.SelectedRowCount
		  
		  If count = 0 Then
		    Return False
		  End If
		  
		  Var removeSongs As New DesktopMenuItem("Remove this song", "removeSongs")
		  If count > 1 Then
		    removeSongs.Text = "Remove " + count.ToString + " songs"
		  End If
		  
		  base.AddMenu(RemoveSongs)
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  Select Case selectedItem.Tag
		  Case "removeSongs"
		    For row As Integer = Me.LastRowIndex DownTo 0
		      If Me.RowSelectedAt(row) Then
		        Me.RemoveRowAt(row)
		      End If
		    Next
		    
		    Return True
		  End Select
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events UpdateTimer
	#tag Event
		Sub Action()
		  If mSongPlaying = "" Then
		    Me.RunMode = Timer.RunModes.Off
		    Return
		  End If
		  
		  For row As Integer = 0 To SongListBox.LastRowIndex
		    Var song As SongElement = SongElement(SongListBox.RowTagAt(row))
		    If mSongPlaying = song.NativePath Then
		      SongListBox.RefreshCell(row, 4)
		      Exit
		    End If
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ImportMusicThread
	#tag Event
		Sub Run()
		  Const maxSize = 84
		  
		  For Each path As String In mPendingToScanSongs
		    Var f As New FolderItem(path, FolderItem.PathModes.Native)
		    If f = Nil Or Not f.Exists Then
		      Continue
		    End If
		    
		    Var reader As TextInputStream = TextInputStream.Open(f)
		    Var fileData As MemoryBlock = reader.ReadAll
		    reader.Close
		    Var tags As Dictionary = ReadID3Tags(fileData)
		    
		    Var title As String = If(tags.HasKey("TIT2") And tags.Value("TIT2").StringValue.Length > 5, tags.Value("TIT2"), f.Name.TrimRight("." + f.Extension))
		    Var album As String = tags.Lookup("TALB", "")
		    Var artist As String = tags.Lookup("TPE1", "")
		    
		    Var result As New SongElement
		    result.NativePath = path
		    result.Title = title
		    result.Album = album
		    result.Artist = artist
		    
		    Var albumImage As Picture
		    If tags.HasKey("APIC") Then
		      albumImage = tags.Value("APIC")
		      If albumImage.Width > maxSize Or albumImage.Height > maxSize Then
		        Var newWidth As Double
		        Var newHeight As Double
		        If albumImage.Width > albumImage.Height Then
		          newWidth = maxSize
		          newHeight = albumImage.Height * maxSize / albumImage.Width
		        Else
		          newHeight = maxSize
		          newWidth = albumImage.Width * maxSize / albumImage.Height
		        End If
		        Var resizedAlbumImage As New Picture(newWidth, newHeight)
		        Var gg As Graphics = resizedAlbumImage.Graphics
		        gg.AntiAliased = True
		        gg.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		        gg.DrawPicture(albumImage, 0, 0, gg.Width, gg.Height, 0, 0, albumImage.Width, albumImage.Height)
		        albumImage = resizedAlbumImage
		      End If
		    End If
		    result.AlbumImage = albumImage
		    
		    Me.AddUserInterfaceUpdate(path : result)
		  Next
		  
		  mPendingToScanSongs.RemoveAll
		End Sub
	#tag EndEvent
	#tag Event
		Sub UserInterfaceUpdate(data() as Dictionary)
		  For Each update As Dictionary In data
		    For Each entry As DictionaryEntry In update
		      For row As Integer = 0 To SongListBox.LastRowIndex
		        If SongElement(SongListBox.RowTagAt(row)).NativePath = entry.Key Then
		          Var song As SongElement = SongElement(entry.Value)
		          SongListBox.RowTagAt(row) = song
		          SongListBox.CellTextAt(row, 1) = song.Title
		          SongListBox.CellTextAt(row, 2) = song.Album
		          SongListBox.CellTextAt(row, 3) = song.Artist
		          SongListBox.RefreshCell(row, 0)
		          Exit For entry
		        End If
		      Next
		    Next
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Super"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
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
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composited"
		Visible=true
		Group="Window Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
