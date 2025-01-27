#tag DesktopWindow
Begin DesktopContainer MiniPlayerContainer
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   400
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
   Width           =   225
   Begin DesktopLabel SongNameLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Song name"
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   206
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   185
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
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "--:--"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   238
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   34
   End
   Begin DesktopProgressBar PositionProgressBar
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   False
      Height          =   20
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   66
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   100
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   238
      Transparent     =   False
      Value           =   50.0
      Visible         =   True
      Width           =   93
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
      Italic          =   False
      Left            =   171
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "--:--"
      TextAlignment   =   3
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   238
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   34
   End
   Begin Timer UpdateTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   1000
      RunMode         =   0
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin DesktopCanvas AlbumImageCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   150
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   39
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   44
      Transparent     =   True
      Visible         =   True
      Width           =   150
   End
   Begin ButtonCanvas PrevButtonCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   45
      Index           =   -2147483648
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   282
      Transparent     =   True
      Visible         =   True
      Width           =   45
   End
   Begin ButtonCanvas PlayPauseButtonCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   45
      Index           =   -2147483648
      Left            =   90
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   282
      Transparent     =   True
      Visible         =   True
      Width           =   45
   End
   Begin ButtonCanvas NextButtonCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   45
      Index           =   -2147483648
      Left            =   160
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   282
      Transparent     =   True
      Visible         =   True
      Width           =   45
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  Update
		  RaiseEvent Opening
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function FormatSeconds(value As Integer) As String
		  Var minutes As Integer = value / 60
		  Var seconds As Integer = value Mod 60
		  
		  Return minutes.ToString(Nil, "00") + ":" + seconds.ToString(Nil, "00")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Update()
		  Var enable As Boolean = mActive
		  PrevButtonCanvas.Enabled = enable
		  NextButtonCanvas.Enabled = enable
		  
		  PlayPauseButtonCanvas.Refresh
		  
		  Var pos As Integer = RaiseEvent PlaybackPositionInSeconds
		  Var length As Integer = RaiseEvent SongLengthInSeconds
		  
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


#tag EndWindowCode

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
#tag EndEvents
#tag Events UpdateTimer
	#tag Event
		Sub Action()
		  Update
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
		  
		  resizedPic.ApplyMask(mask)
		  resizedPic.Graphics.DrawPicture(mAlbumIcon, 0, 0, resizedPic.Graphics.Width, resizedPic.Graphics.Height, 0, 0, mAlbumIcon.Width, mAlbumIcon.Height)
		  
		  g.ShadowBrush = New ShadowBrush(0, padding / 4, Color.RGB(0, 0, 0, 150), padding / 2)
		  g.DrawPicture(resizedPic, padding, padding, g.Width - padding * 2, g.Height - padding * 2, 0, 0, resizedPic.Width, resizedPic.Height)
		  
		  g.DrawingColor = Color.RGB(0, 0, 0, 200)
		  g.DrawRoundRectangle(padding, padding, g.Width - padding * 2, g.Height - padding * 2, radius, radius)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PrevButtonCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  Var icon As Picture = skipbackwardcircle
		  g.DrawPicture(icon, 0, 0, g.Width, g.Height, 0, 0, icon.Width, icon.Height)
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
		  g.DrawPicture(icon, 0, 0, g.Width, g.Height, 0, 0, icon.Width, icon.Height)
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
		  g.DrawPicture(icon, 0, 0, g.Width, g.Height, 0, 0, icon.Width, icon.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  RaiseEvent NextSongPressed
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
