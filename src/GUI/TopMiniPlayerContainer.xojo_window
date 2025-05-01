#tag DesktopWindow
Begin DesktopContainer TopMiniPlayerContainer
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
   Width           =   700
   Begin Timer UpdateTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   1000
      RunMode         =   0
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin DesktopCanvas BackgroundCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   78
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Visible         =   True
      Width           =   700
      Begin ButtonCanvas PrevButtonCanvas
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Enabled         =   True
         Height          =   30
         Index           =   -2147483648
         InitialParent   =   "BackgroundCanvas"
         Left            =   74
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   24
         Transparent     =   True
         Visible         =   True
         Width           =   30
      End
      Begin ButtonCanvas PlayPauseButtonCanvas
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Enabled         =   True
         Height          =   44
         Index           =   -2147483648
         InitialParent   =   "BackgroundCanvas"
         Left            =   108
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   16
         Transparent     =   True
         Visible         =   True
         Width           =   44
      End
      Begin ButtonCanvas NextButtonCanvas
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Enabled         =   True
         Height          =   30
         Index           =   -2147483648
         InitialParent   =   "BackgroundCanvas"
         Left            =   156
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   24
         Transparent     =   True
         Visible         =   True
         Width           =   30
      End
      Begin DesktopSlider VolumeSlider
         AllowAutoDeactivate=   True
         AllowLiveScrolling=   True
         Enabled         =   True
         Height          =   30
         Index           =   -2147483648
         InitialParent   =   "BackgroundCanvas"
         Left            =   540
         LineStep        =   1
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumValue    =   255
         MinimumValue    =   0
         PageStep        =   20
         Scope           =   2
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         TickMarkStyle   =   0
         Tooltip         =   ""
         Top             =   26
         Transparent     =   True
         Value           =   127
         Visible         =   True
         Width           =   68
      End
      Begin DesktopCanvas VolumeUpIconCanvas
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Enabled         =   True
         Height          =   18
         Index           =   -2147483648
         InitialParent   =   "BackgroundCanvas"
         Left            =   614
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   30
         Transparent     =   True
         Visible         =   True
         Width           =   18
      End
      Begin DesktopCanvas VolumeDownIconCanvas
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Enabled         =   True
         Height          =   18
         Index           =   -2147483648
         InitialParent   =   "BackgroundCanvas"
         Left            =   516
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   30
         Transparent     =   True
         Visible         =   True
         Width           =   18
      End
   End
   Begin DesktopCanvas DisplayCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   68
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   215
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   33
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   5
      Transparent     =   False
      Visible         =   True
      Width           =   270
      Begin DesktopLabel SongNameLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "DisplayCanvas"
         Italic          =   False
         Left            =   283
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Song name"
         TextAlignment   =   2
         TextColor       =   DisplayTextColorGroup
         Tooltip         =   ""
         Top             =   17
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   198
      End
      Begin DesktopLabel PositionLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "DisplayCanvas"
         Italic          =   False
         Left            =   286
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "--:--"
         TextAlignment   =   0
         TextColor       =   DisplayTextColorGroup
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   40
      End
      Begin DesktopProgressBar PositionProgressBar
         Active          =   False
         AllowAutoDeactivate=   True
         AllowTabStop    =   True
         Enabled         =   False
         Height          =   20
         Indeterminate   =   False
         Index           =   -2147483648
         InitialParent   =   "DisplayCanvas"
         Left            =   334
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         MaximumValue    =   100
         PanelIndex      =   0
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   0
         Tooltip         =   ""
         Top             =   40
         Transparent     =   False
         Value           =   50.0
         Visible         =   True
         Width           =   90
         _mIndex         =   0
         _mInitialParent =   ""
         _mName          =   ""
         _mPanelIndex    =   0
      End
      Begin DesktopLabel DurationLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "DisplayCanvas"
         Italic          =   False
         Left            =   431
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "--:--"
         TextAlignment   =   3
         TextColor       =   DisplayTextColorGroup
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   40
      End
      Begin DesktopCanvas AlbumImageCanvas
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Enabled         =   True
         Height          =   60
         Index           =   -2147483648
         InitialParent   =   "DisplayCanvas"
         Left            =   219
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   9
         Transparent     =   True
         Visible         =   True
         Width           =   60
      End
      Begin DesktopCanvas ScreenCanvas
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Enabled         =   True
         Height          =   68
         Index           =   -2147483648
         InitialParent   =   "DisplayCanvas"
         Left            =   215
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   5
         Transparent     =   True
         Visible         =   True
         Width           =   270
      End
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  // Fonts
		  Const fontName = "System"
		  SongNameLabel.FontName = fontName
		  PositionLabel.FontName = fontName
		  DurationLabel.FontName = fontName
		  
		  mIconCache = New Dictionary
		  Update
		  RaiseEvent Opening
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  // For some reason, Linux labels aren't updating their
		  // text color when the color appearance changes, so
		  // we will be forcing it to update
		  #If TargetLinux
		    Static darkMode As Boolean = Color.IsDarkMode
		    
		    If darkMode <> Color.IsDarkMode Then
		      darkMode = Color.IsDarkMode
		      SongNameLabel.TextColor = DisplayTextColorGroup
		      PositionLabel.TextColor = DisplayTextColorGroup
		      DurationLabel.TextColor = DisplayTextColorGroup
		    End If
		  #EndIf
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function AppearanceIcon(icon As Picture) As Picture
		  Static darkMode As Boolean = Color.IsDarkMode
		  If darkMode <> Color.IsDarkMode Then
		    mIconCache.RemoveAll
		  End If
		  
		  Var cachedPic As Picture = mIconCache.Lookup(icon, Nil)
		  If cachedPic = Nil Or cachedPic.Width <> icon.Width Or cachedPic.Height <> icon.Height Then
		    darkMode = Color.IsDarkMode
		    cachedPic = New Picture(icon.Width, icon.Height)
		    cachedPic.VerticalResolution = 256
		    cachedPic.HorizontalResolution = 256
		    cachedPic.Graphics.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		    cachedPic.Graphics.AntiAliased = True
		    cachedPic.Graphics.DrawPicture(icon, 0, 0, icon.Width, icon.Height)
		    
		    // Const kMaxMapOffset = 255
		    // Var map(kMaxMapOffset) As Integer
		    // For i As Integer = 0 To kMaxMapOffset
		    // map(i) = If(Color.IsDarkMode, 200, 70) 'kMaxMapOffset - i
		    // Next
		    // result.RGBSurface.Transform(map)
		    
		    For y As Integer = 0 To icon.Height
		      Var value As Integer = Max(50, 200 - y) + If(Color.IsDarkMode, 50, 0)
		      For x As Integer = 0 To icon.Width
		        If cachedPic.RGBSurface.Pixel(x, y) = Color.Black Then
		          cachedPic.RGBSurface.Pixel(x, y) = Color.RGB(value, value, value)
		        End If
		      Next
		    Next
		    
		    mIconCache.Value(icon) = cachedPic
		  End If
		  
		  Return cachedPic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawBackground(g As Graphics)
		  Static cachedPic As Picture
		  Static darkMode As Boolean = Color.IsDarkMode
		  If cachedPic = Nil Or cachedPic.Width <> g.Width Or cachedPic.Height <> g.Height Or darkMode <> Color.IsDarkMode Then
		    cachedPic = New Picture(g.Width, g.Height)
		    darkMode = Color.IsDarkMode
		    Var stops() As Pair
		    Var light As Color = ToolbarBackgroundLightColorGroup
		    Var dark As Color = ToolbarBackgroundDarkColorGroup
		    stops.Add(0.0 : light)
		    stops.Add(1.0 : dark)
		    Var gradient As New LinearGradientBrush(New Point(g.Width / 2, 0), New Point(g.Width / 2, g.Height), stops)
		    
		    cachedPic.Graphics.Brush = gradient
		    
		    cachedPic.Graphics.FillRectangle(0, 0, g.Width, g.Height)
		  End If
		  
		  g.DrawPicture(cachedPic, 0, 0, g.Width, g.Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatSeconds(value As Integer) As String
		  Var minutes As Integer = value / 60
		  Var seconds As Integer = value Mod 60
		  
		  Return minutes.ToString(Nil, "00") + ":" + seconds.ToString(Nil, "00")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVolume(value As Integer)
		  VolumeSlider.Value = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Update()
		  Var enable As Boolean = mActive
		  PrevButtonCanvas.Enabled = enable
		  NextButtonCanvas.Enabled = enable
		  
		  PlayPauseButtonCanvas.Refresh
		  
		  Var pos As Integer = RaiseEvent PlaybackPositionInSeconds
		  Var length As Integer = RaiseEvent SongLengthInSeconds
		  
		  // This is a fix for the issue I've been seeing where the player
		  // got stuck at the end of some songs, randomly. It looks like
		  // DesktopMoviePlayer won't fire the PlaybackStopped event with
		  // these files, so I'll be detecting it manually.
		  // Issue #5 
		  Static previousPos As Integer = -1
		  Static samePosTimes As Integer = 0
		  If previousPos = pos Then
		    samePosTimes = samePosTimes + 1
		  End If
		  
		  If samePosTimes > 5 And IsPlaying Then
		    #If DebugBuild
		      System.DebugLog("MP3Player reached the end of the song, but PlaybackStopped didn't fire, we will ask it to continue")
		    #EndIf
		    samePosTimes = 0
		    previousPos = -1
		    RaiseEvent NextSongPressed
		    Return
		  End If
		  previousPos = pos
		  // End of fix #5
		  
		  SongNameLabel.Text = RaiseEvent SongName
		  PositionLabel.Text = FormatSeconds(pos)
		  DurationLabel.Text = FormatSeconds(length)
		  
		  If length > 0 Then
		    PositionProgressBar.MaximumValue = length
		    PositionProgressBar.Value = pos
		  Else
		    PositionProgressBar.MaximumValue = 1
		    PositionProgressBar.Value = 0
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event IsPlaying() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NextSongPressed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Opening()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PlaybackPositionInSeconds() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PlayPausePressed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PreviousSongPressed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Seek(newPosition As Double)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SongLengthInSeconds() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SongName() As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event VolumeChanged(newValue As Integer)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mActive
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mActive = value
			  
			  UpdateTimer.RunMode = If(value, Timer.RunModes.Multiple, Timer.RunModes.Off)
			  PositionProgressBar.Enabled = value
			  
			  Update
			End Set
		#tag EndSetter
		Active As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mAlbumIcon
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mAlbumIcon = value
			  AlbumImageCanvas.Refresh
			End Set
		#tag EndSetter
		AlbumIcon As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mActive As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAlbumIcon As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIconCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Volume As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events UpdateTimer
	#tag Event
		Sub Action()
		  Update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BackgroundCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  Const padding = 8
		  
		  DrawBackground(g.Clip(0, 0, g.Width, g.Height))
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PrevButtonCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  Var icon As Picture = skipbackwardcircle
		  
		  Var brush As New LinearGradientBrush
		  brush.StartPoint = New Point(g.Width / 2, 0)
		  brush.EndPoint = New Point(g.Width / 2, g.Height)
		  brush.GradientStops.Add(0.0 : color.Red)
		  brush.GradientStops.Add(0.0 : color.Blue)
		  g.Brush = brush
		  
		  g.DrawPicture(AppearanceIcon(icon), 0, 0, g.Width, g.Height, 0, 0, icon.Width, icon.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  RaiseEvent PreviousSongPressed
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayPauseButtonCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  Var icon As Picture = If(RaiseEvent IsPlaying, pausefill, playfill)
		  g.DrawPicture(AppearanceIcon(icon), 0, 0, g.Width, g.Height, 0, 0, icon.Width, icon.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  RaiseEvent PlayPausePressed
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NextButtonCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  Var icon As Picture = skipforwardcircle
		  g.DrawPicture(AppearanceIcon(icon), 0, 0, g.Width, g.Height, 0, 0, icon.Width, icon.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  RaiseEvent NextSongPressed
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VolumeSlider
	#tag Event
		Sub ValueChanged()
		  RaiseEvent VolumeChanged(Me.Value)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VolumeUpIconCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  Var icon As Picture = volumeupfill
		  g.AntiAliased = True
		  g.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		  g.DrawPicture(AppearanceIcon(icon), 0, 0, g.Width, g.Height, 0, 0, icon.Width, icon.Height)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VolumeDownIconCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  Var icon As Picture = volumeofffill
		  g.AntiAliased = True
		  g.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		  g.DrawPicture(AppearanceIcon(icon), 0, 0, g.Width, g.Height, 0, 0, icon.Width, icon.Height)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DisplayCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  Const radius = 10
		  Const padding = 10
		  
		  Static cachedPic As Picture
		  Static darkMode As Boolean = Color.IsDarkMode
		  If cachedPic = Nil Or cachedPic.Width <> g.Width Or cachedPic.Height <> g.Height Or darkMode <> Color.IsDarkMode Then
		    cachedPic = New Picture(g.Width, g.Height)
		    darkMode = Color.IsDarkMode
		    Var gg As Graphics = cachedPic.Graphics
		    Var clipPath As New GraphicsPath
		    clipPath.AddRoundRectangle(0, 0, gg.Width, gg.Height, radius, radius)
		    #If Not TargetWindows
		      gg.ClipToPath(clipPath)
		    #EndIf
		    
		    // Background
		    gg.SaveState
		    Var stops() As Pair
		    stops.Add(0.0 : Color.RGB(232, 235, 222))
		    stops.Add(0.49 : Color.RGB(231, 234, 208))
		    stops.Add(0.50 : Color.RGB(225, 228, 201))
		    stops.Add(1.0 : Color.RGB(207, 211, 178))
		    Var gradient As LinearGradientBrush
		    gradient = New LinearGradientBrush(New Point(gg.Width / 2, 0), New Point(gg.Width / 2, gg.Height), stops)
		    
		    gg.DrawingColor = DisplayBaseBackgroundColorGroup
		    gg.FillRoundRectangle(0, 0, gg.Width, gg.Height, radius, radius)
		    
		    gg.Brush = Nil
		    
		    gg.ShadowBrush = New ShadowBrush(0, 1, Color.RGB(0, 0, 0, 0), 9)
		    gg.DrawingColor = Color.RGB(0, 0, 0, 0)
		    gg.PenSize = 2
		    gg.DrawRoundRectangle(-5, -5, gg.Width + 10, gg.Height + 10, radius, radius)
		    gg.ShadowBrush = Nil
		    gg.RestoreState
		    
		    // Outer border
		    Var outerBorderGradient As New LinearGradientBrush
		    outerBorderGradient.GradientStops.Add(0.0 : If(Color.IsDarkMode, Color.RGB(4, 4, 4), Color.RGB(124, 124, 124)))
		    outerBorderGradient.GradientStops.Add(1.0 : If(Color.IsDarkMode, Color.RGB(64, 64, 64), Color.RGB(241, 241, 241)))
		    outerBorderGradient.StartPoint = New Point(gg.Width / 2, 0)
		    outerBorderGradient.EndPoint = New Point(gg.Width / 2, gg.Height)
		    gg.PenSize = 1
		    gg.Brush = outerBorderGradient
		    gg.DrawingColor = Color.Red
		    gg.DrawRoundRectangle(0, 0, gg.Width, gg.Height, radius + 10, radius + 10)
		    gg.Brush = Nil
		    
		    // Border
		    gg.DrawingColor = If(Color.IsDarkMode, Color.RGB(44, 47, 51, 200), Color.RGB(144, 147, 151, 150))
		    gg.DrawRoundRectangle(1, 1, gg.Width - 2, gg.Height - 2, radius + 10, radius + 10)
		  End If
		  
		  g.DrawPicture(cachedPic, 0, 0, g.Width, g.Height)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PositionProgressBar
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  Var newValue As Double = Me.MaximumValue / Me.Width * x
		  Me.Value = newValue
		  RaiseEvent Seek(newValue)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  #If TargetLinux
		    Me.Top = Me.Top - 5
		  #EndIf
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AlbumImageCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  Const padding = 10
		  Const radius = 15
		  
		  If mAlbumIcon = Nil Then
		    Return
		  End If
		  
		  Var resizedPic As New Picture(g.Width - padding * 2, g.Height - padding * 2, 32)
		  
		  Var mask As New Picture(resizedPic.Width, resizedPic.Height, 32)
		  mask.Graphics.DrawingColor = Color.Black
		  mask.Graphics.FillRoundRectangle(0, 0, mask.Width, mask.Height, radius, radius)
		  
		  // resizedPic.ApplyMask(mask)
		  resizedPic.Graphics.AntiAliased = True
		  resizedPic.Graphics.AntiAliasMode = Graphics.AntiAliasModes.HighQuality
		  resizedPic.Graphics.DrawPicture(mAlbumIcon, 0, 0, resizedPic.Graphics.Width, resizedPic.Graphics.Height, 0, 0, mAlbumIcon.Width, mAlbumIcon.Height)
		  
		  // g.ShadowBrush = New ShadowBrush(0, padding / 4, Color.RGB(0, 0, 0, 150), padding / 2)
		  g.DrawPicture(resizedPic, padding, padding, g.Width - padding * 2, g.Height - padding * 2, 0, 0, resizedPic.Width, resizedPic.Height)
		  
		  g.DrawingColor = Color.RGB(0, 0, 0, 200)
		  // g.DrawRoundRectangle(padding, padding, g.Width - padding * 2, g.Height - padding * 2, radius, radius)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScreenCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  Const radius = 10
		  Const padding = 10
		  
		  Var gg As Graphics = g
		  
		  Var clipPath As New GraphicsPath
		  clipPath.AddRoundRectangle(0, 0, gg.Width, gg.Height, radius, radius)
		  #If Not TargetWindows
		    gg.ClipToPath(clipPath)
		  #EndIf
		  
		  Var brush As New LinearGradientBrush
		  brush.StartPoint = New Point(g.Width / 2, 0)
		  brush.EndPoint = New Point(g.Width / 2, g.Height)
		  brush.GradientStops.Add(0.0 : If(Color.IsDarkMode, Color.RGB(255, 255, 255, 245), Color.RGB(255, 255, 255, 180)))
		  brush.GradientStops.Add(0.49 : If(Color.IsDarkMode, Color.RGB(255, 255, 255, 250), Color.RGB(255, 255, 255, 230)))
		  brush.GradientStops.Add(0.50 : Color.RGB(0, 0, 0, 250))
		  brush.GradientStops.Add(1.0 : Color.RGB(0, 0, 0, 250))
		  gg.Brush = brush
		  
		  gg.FillRectangle(0, 0, gg.Width, gg.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  #If TargetWindows
		    Me.Visible = False
		  #Endif
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
	#tag ViewProperty
		Name="AlbumIcon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Active"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
