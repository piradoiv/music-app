#tag DesktopWindow
Begin DesktopWindow MainWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   True
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   450
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   948621311
   MenuBarVisible  =   False
   MinimumHeight   =   360
   MinimumWidth    =   420
   Resizeable      =   True
   Title           =   "Music"
   Type            =   0
   Visible         =   True
   Width           =   630
   Begin MiniPlayerContainer MiniPlayer
      Active          =   False
      AlbumIcon       =   0
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF
      Composited      =   False
      Enabled         =   True
      HasBackgroundColor=   False
      Height          =   398
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   405
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   225
   End
   Begin SongListContainer SongList
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF
      Composited      =   False
      Enabled         =   True
      HasBackgroundColor=   False
      Height          =   450
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   405
   End
   Begin MusicApp Music
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin DesktopMoviePlayer MP3Player
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      AutoAdjustToMovieSize=   True
      AutoPlay        =   False
      AutoRepeat      =   False
      ControllerHeight=   0
      ControllerWidth =   0
      Duration        =   0.0
      Enabled         =   True
      HasBorder       =   True
      HasController   =   False
      HasStepControls =   True
      HasVolumeControl=   True
      Height          =   100
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   -112
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Movie           =   0
      PanelIndex      =   0
      Position        =   0.0
      RepeatInReverse =   False
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   -134
      Transparent     =   False
      Visible         =   True
      Volume          =   0
      Width           =   100
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopButton OpenFilesButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Open Files..."
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   417
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   410
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   193
   End
   Begin DesktopSeparator Separator1
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   450
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   382
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   7
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Visible         =   True
      Width           =   44
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Function AlbumIcon(songNativePath As String) As Picture
		  Var result As New Picture(256, 256)
		  Var g As Graphics = result.Graphics
		  
		  Var albumImage As Picture = Music.AlbumImage(songNativePath)
		  If albumImage <> Nil Then
		    g.DrawPicture(albumImage, 0, 0, g.Width, g.Height, 0, 0, albumImage.Width, albumImage.Height)
		  Else
		    g.DrawingColor = Color.White
		    g.FillRectangle(0, 0, g.Width, g.Height)
		    
		    g.FontSize = g.Height / 3
		    Var note As String = "🎵"
		    Var w As Double = g.TextWidth(note)
		    g.DrawText(note, g.Width / 2 - w / 2, g.Height / 2 + g.FontAscent / 2.5)
		  End If
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawAlbumIcon(songNativePath As String, g As Graphics, padding As Integer, radius As Integer)
		  Var p As Picture = AlbumIcon(songNativePath)
		  Var resizedPic As New Picture(g.Width - padding * 2, g.Height - padding * 2, 32)
		  
		  Var mask As New Picture(resizedPic.Width, resizedPic.Height, 32)
		  mask.Graphics.DrawingColor = Color.Black
		  mask.Graphics.FillRoundRectangle(0, 0, mask.Width, mask.Height, 10, 10)
		  
		  resizedPic.ApplyMask(mask)
		  resizedPic.Graphics.DrawPicture(p, 0, 0, resizedPic.Graphics.Width, resizedPic.Graphics.Height, 0, 0, p.Width, p.Height)
		  
		  g.ShadowBrush = New ShadowBrush(0, padding / 2, Color.RGB(0, 0, 0, 125), padding / 2)
		  g.DrawPicture(resizedPic, padding, padding, g.Width - padding * 2, g.Height - padding * 2, 0, 0, resizedPic.Width, resizedPic.Height)
		  
		  g.DrawingColor = Color.RGB(0, 0, 0, 200)
		  g.DrawRoundRectangle(padding, padding, g.Width - padding * 2, g.Height - padding * 2, radius, radius)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GenerateAlbumIcon() As Picture
		  Var p As New Picture(300, 300)
		  Var g As Graphics = p.Graphics
		  
		  Var path As String
		  If mMusicFile <> Nil Then
		    path = mMusicFile.NativePath
		  End If
		  DrawAlbumIcon(path, g, 0, 0)
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadMusicFile(f As FolderItem)
		  mMusicFile = f
		  
		  If f <> Nil And f.Exists Then
		    MP3Player.Movie = Movie.Open(f)
		  Else
		    MP3Player.Stop
		    MP3Player.Movie = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PlaySong(nativePath As String)
		  mMusicFile = New FolderItem(nativePath, FolderItem.PathModes.Native)
		  If nativePath = "" or Not mMusicFile.Exists Then
		    StopPlaying
		    Return
		  End If
		  
		  mIsPlaying = True
		  
		  MP3Player.Movie = Movie.Open(New FolderItem(nativePath, FolderItem.PathModes.Native))
		  MP3Player.Position = 0
		  MP3Player.Play
		  
		  SongList.Play(nativePath)
		  
		  MiniPlayer.AlbumIcon = GenerateAlbumIcon
		  MiniPlayer.Active = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StopPlaying()
		  mMusicFile = Nil
		  mIsPlaying = False
		  SongList.Stop
		  MiniPlayer.Active = False
		  MP3Player.Stop
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mIsPlaying As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMusicFile As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events MiniPlayer
	#tag Event
		Sub PlayPausePressed()
		  If mMusicFile = Nil Then
		    StopPlaying
		    Return
		  End If
		  
		  If mIsPlaying Then
		    MP3Player.Stop
		  Else
		    MP3Player.Play
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function PlaybackPositionInSeconds() As Integer
		  Return MP3Player.Position
		End Function
	#tag EndEvent
	#tag Event
		Function SongLengthInSeconds() As Integer
		  Return MP3Player.Duration
		End Function
	#tag EndEvent
	#tag Event
		Function SongName() As String
		  If mMusicFile = Nil Or Not mMusicFile.Exists Then
		    Return "-"
		  End If
		  
		  Return mMusicFile.Name.TrimRight("." + mMusicFile.Extension)
		End Function
	#tag EndEvent
	#tag Event
		Function IsPlaying() As Boolean
		  Return mIsPlaying
		End Function
	#tag EndEvent
	#tag Event
		Sub Seek(newPosition As Double)
		  MP3Player.Position = newPosition
		End Sub
	#tag EndEvent
	#tag Event
		Sub NextSongPressed()
		  SongList.Play(mMusicFile.NativePath)
		  PlaySong(SongList.NextSongNativePath)
		End Sub
	#tag EndEvent
	#tag Event
		Sub PreviousSongPressed()
		  If MP3Player.Position > 5 Then
		    MP3Player.Position = 0
		    Return
		  End If
		  
		  SongList.Play(mMusicFile.NativePath)
		  PlaySong(SongList.PreviousSongNativePath)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.AlbumIcon = GenerateAlbumIcon
		End Sub
	#tag EndEvent
	#tag Event
		Sub VolumeChanged(newValue As Integer)
		  MP3Player.Volume = newValue
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SongList
	#tag Event
		Sub SongDoublePressed(nativePath As String)
		  PlaySong(nativePath)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DrawAlbumIcon(songNativePath As String, g As Graphics)
		  DrawAlbumIcon(songNativePath, g, 5, 8)
		End Sub
	#tag EndEvent
	#tag Event
		Sub RemoveSong(nativePath As String)
		  Music.RemoveSong(New FolderItem(nativePath))
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Music
	#tag Event
		Sub NewFilesAdded(nativePaths() As String)
		  SongList.AddSongs(nativePaths)
		End Sub
	#tag EndEvent
	#tag Event
		Sub SongRemoved(nativePath As String)
		  If mMusicFile <> Nil And mMusicFile.NativePath = nativePath Then
		    mMusicFile = Nil
		    MP3Player.Stop
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MP3Player
	#tag Event
		Sub Opening()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub PlaybackStarted()
		  mIsPlaying = True
		  MiniPlayer.Active = True
		  SongList.Play(mMusicFile.NativePath)
		End Sub
	#tag EndEvent
	#tag Event
		Sub PlaybackStopped()
		  If Me.Duration > 0 And Me.Duration - Me.Position < 1 Then
		    PlaySong(SongList.NextSongNativePath)
		    Return
		  End If
		  
		  mIsPlaying = False
		  MiniPlayer.Active = False
		  SongList.Stop
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OpenFilesButton
	#tag Event
		Sub Pressed()
		  Var folder As FolderItem = FolderItem.ShowSelectFolderDialog
		  If folder = Nil Then
		    Return
		  End If
		  
		  Music.AddFolderRecursively(folder)
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
		Name="Interfaces"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
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
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
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
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
