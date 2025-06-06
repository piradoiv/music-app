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
   HasTitleBar     =   True
   Height          =   500
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   False
   MinimumHeight   =   360
   MinimumWidth    =   650
   Resizeable      =   True
   Title           =   "Music"
   Type            =   0
   Visible         =   True
   Width           =   700
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
      Height          =   380
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
      Top             =   78
      Transparent     =   True
      Visible         =   True
      Width           =   700
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
   Begin TopMiniPlayerContainer MiniPlayer
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
      Height          =   78
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   700
   End
   Begin DesktopButton OpenFilesButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Add Music"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   466
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   92
   End
   Begin DesktopSeparator Separators
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   1
      Index           =   0
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   9
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   78
      Transparent     =   False
      Visible         =   True
      Width           =   700
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopSeparator Separators
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   1
      Index           =   1
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   14
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   458
      Transparent     =   False
      Visible         =   True
      Width           =   700
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  MainWindow.Width = App.Preferences.Lookup("mainWindow.width", Self.Width)
		  MainWindow.Height = App.Preferences.Lookup("mainWindow.height", Self.Height)
		  
		  #If TargetMacOS
		    Self.MenuBar = MainMenuBar
		    Try
		      Declare Function NSClassFromString Lib "Foundation" (aClassName As CFStringRef) As Ptr
		      If NSClassFromString( "NSVisualEffectView" ) <> Nil Then
		        Const AppKit = "AppKit"
		        Const NSWindowTitleHidden = 1
		        Const NSWindowStyleMaskFullSizeContentView = 32768
		        
		        Declare Sub titleVisibility Lib AppKit Selector "setTitleVisibility:" (handle As Ptr, value As Integer)
		        titleVisibility(Me.Handle, NSWindowTitleHidden)
		        
		        Declare Sub setStyleMask Lib AppKit Selector "setStyleMask:" (handle As Ptr, value As Integer)
		        Declare Function styleMask Lib AppKit Selector "styleMask" (handle As Ptr) As Integer
		        setStyleMAsk(Me.Handle, styleMask(Me.Handle) + NSWindowStyleMaskFullSizeContentView)
		        
		        Declare Sub titlebarAppearsTransparent Lib AppKit Selector "setTitlebarAppearsTransparent:" (handle As Ptr, value As Boolean)
		        titleBarAppearsTransparent(Me.Handle, True)
		      End If
		    End Try
		  #EndIf
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  // Separators won't look right on Dark Mode on Linux
		  #If TargetLinux
		    Var showSeparators As Boolean = Not Color.IsDarkMode
		    For i As Integer = 0 To 1
		      Separators(i).Visible = showSeparators
		    Next
		  #EndIf
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  App.Preferences.Set("mainWindow.width", Self.Width)
		  App.Preferences.Set("mainWindow.height", Self.Height)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function AlbumIcon(songNativePath As String) As Picture
		  If mAlbumIconCache.HasKey(songNativePath) Then
		    Return mAlbumIconCache.Value(songNativePath)
		  End If
		  
		  Var result As New Picture(256, 256)
		  Var g As Graphics = result.Graphics
		  g.AntiAliased = True
		  g.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		  
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
		  
		  mAlbumIconCache.Value(songNativePath) = result
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  mAlbumIconCache = New Dictionary
		  mDrawAlbumIconCache = New Dictionary
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawAlbumIcon(songNativePath As String, g As Graphics, padding As Integer, radius As Integer)
		  g.AntiAliased = True
		  g.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		  
		  Var picWidth As Double = g.Width - padding * 2
		  Var picHeight As Double = g.Height - padding * 2
		  
		  If mDrawAlbumIconCache.HasKey(songNativePath) Then
		    Var result As Picture = mDrawAlbumIconCache.Value(songNativePath)
		    If result <> Nil And result.Width = picWidth And result.Height = picHeight Then
		      g.DrawPicture(result, padding, padding, picWidth, picHeight)
		      Return
		    End If
		  End If
		  
		  Var p As Picture = AlbumIcon(songNativePath)
		  Var resizedPic As New Picture(picWidth, picHeight, 32)
		  Var gg As Graphics = resizedPic.Graphics
		  gg.AntiAliased = True
		  gg.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		  
		  Var mask As New Picture(resizedPic.Width, resizedPic.Height, 32)
		  mask.Graphics.DrawingColor = Color.Black
		  mask.Graphics.FillRoundRectangle(0, 0, mask.Width, mask.Height, 10, 10)
		  resizedPic.ApplyMask(mask)
		  
		  // gg.ShadowBrush = New ShadowBrush(0, padding / 2, Color.RGB(0, 0, 0, 125), padding / 2)
		  // gg.DrawPicture(p, padding, padding, gg.Width - padding * 2, gg.Height - padding * 2, 0, 0, gg.Width, gg.Height)
		  
		  gg.DrawingColor = Color.RGB(0, 0, 0, 200)
		  gg.DrawRoundRectangle(padding, padding, g.Width - padding * 2, g.Height - padding * 2, radius, radius)
		  
		  gg.DrawPicture(p, 0, 0, gg.Width, gg.Height, 0, 0, p.Width, p.Height)
		  // gg.DrawPicture(p, 0, 0, g.Width, g.Height, 0, 0, p.Width, p.Height)
		  
		  mDrawAlbumIconCache.Value(songNativePath) = resizedPic
		  g.DrawPicture(resizedPic, padding, padding, g.Width, g.Height)
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
		  mChangingSong = True
		  
		  MP3Player.Movie = Movie.Open(New FolderItem(nativePath, FolderItem.PathModes.Native))
		  MP3Player.Position = 0
		  MP3Player.Play
		  
		  SongList.Play(nativePath)
		  
		  mChangingSong = False
		  
		  MiniPlayer.AlbumIcon = GenerateAlbumIcon
		  MiniPlayer.Active = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StopPlaying()
		  mIsPlaying = False
		  SongList.Stop
		  MiniPlayer.Active = False
		  MP3Player.Stop
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mAlbumIconCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChangingSong As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDrawAlbumIconCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsPlaying As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMusicFile As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events SongList
	#tag Event
		Sub SongDoublePressed(nativePath As String)
		  PlaySong(nativePath)
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
		  Me.Volume = 127
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
		  If mIsPlaying And Not mChangingSong Then
		    PlaySong(SongList.NextSongNativePath)
		    Return
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MiniPlayer
	#tag Event
		Sub PlayPausePressed()
		  If mMusicFile = Nil Then
		    StopPlaying
		    Return
		  End If
		  
		  If mIsPlaying Then
		    mIsPlaying = False
		    StopPlaying
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
		  Me.SetVolume(App.Preferences.Lookup("volume", 255))
		  Me.AlbumIcon = GenerateAlbumIcon
		End Sub
	#tag EndEvent
	#tag Event
		Sub VolumeChanged(newValue As Integer)
		  MP3Player.Volume = newValue
		  App.Preferences.Set("volume", newValue)
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
		Name="HasTitleBar"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
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
