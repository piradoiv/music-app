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
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   260
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   107
   End
   Begin DesktopListBox SongListBox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   True
      Bold            =   False
      ColumnCount     =   3
      ColumnWidths    =   "50,*,50"
      DefaultRowHeight=   48
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   1
      HasBorder       =   False
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   248
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
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
      Period          =   10
      RunMode         =   2
      Scope           =   2
      TabPanelIndex   =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub AddSongs(nativePaths() As String)
		  For Each path As String In nativePaths
		    Var f As New FolderItem(path, FolderItem.PathModes.Native)
		    If f = Nil Or Not f.Exists Then
		      Continue
		    End If
		    
		    SongListBox.AddRow("", f.Name, "")
		    SongListBox.RowTagAt(SongListBox.LastAddedRowIndex) = f.NativePath
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play(nativePath As String)
		  For i As Integer = 0 To SongListBox.LastRowIndex
		    Var path As String = SongListBox.RowTagAt(i)
		    If path = nativePath Then
		      mRowPlaying = i
		      Exit
		    End If
		  Next
		  
		  ResetPlayingIndicator
		  UpdateTimer.RunMode = Timer.RunModes.Multiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetPlayingIndicator()
		  For i As Integer = 0 To SongListBox.LastRowIndex
		    SongListBox.RefreshCell(i, 2)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  mRowPlaying = -1
		  ResetPlayingIndicator
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AddFilesFromDirectory(folder As FolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DrawAlbumIcon(g As Graphics)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RemoveSong(nativePath As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SongDoublePressed(nativePath As String)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mRowPlaying As Integer = -1
	#tag EndProperty


#tag EndWindowCode

#tag Events OpenFilesButton
	#tag Event
		Sub Pressed()
		  Var folder As FolderItem = FolderItem.ShowSelectFolderDialog
		  If folder = Nil Then
		    Return
		  End If
		  
		  RaiseEvent AddFilesFromDirectory(folder)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SongListBox
	#tag Event
		Function PaintCellText(g as Graphics, row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  Const padding = 5
		  Const radius = 8
		  
		  Select Case column
		  Case 0
		    RaiseEvent DrawAlbumIcon(g)
		    
		    Return True
		    
		  Case 2
		    If row <> mRowPlaying Then
		      Return False
		    End If
		    
		    Var w As Double = g.Width / 3
		    
		    g.SaveState
		    g.DrawingColor = Color.HSV(Color.HighlightColor.Hue, 1, 1)
		    Var now As DateTime = DateTime.Now
		    For i As Integer = 0 To 2
		      Var h As Double = Sin((now.SecondsFrom1970 + i * .6) * 10) * g.Height
		      g.FillRectangle(i * w, g.Height - h, i * w + w, h)
		    Next
		    g.RestoreState
		    
		    Return True
		    
		  End Select
		  
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub DoublePressed()
		  mRowPlaying = Me.SelectedRowIndex
		  ResetPlayingIndicator
		  
		  Var nativePath As Variant = Me.RowTagAt(Me.SelectedRowIndex)
		  If nativePath <> Nil Then
		    RaiseEvent SongDoublePressed(nativePath)
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
		    Var path As String = Me.RowTagAt(Me.SelectedRowIndex)
		    Me.RemoveRowAt(Me.SelectedRowIndex)
		    RaiseEvent RemoveSong(path)
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UpdateTimer
	#tag Event
		Sub Action()
		  If mRowPlaying = -1 Then
		    Me.RunMode = Timer.RunModes.Off
		    Return
		  End If
		  
		  SongListBox.RefreshCell(mRowPlaying, 2)
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
