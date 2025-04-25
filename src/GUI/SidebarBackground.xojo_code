#tag Class
Protected Class SidebarBackground
Inherits DesktopCanvas
	#tag CompatibilityFlags = ( TargetDesktop and ( Target32Bit or Target64Bit ) )
	#tag Event
		Sub Opening()
		  #If TargetMacOS
		    // NSView
		    Declare Sub addSubview Lib "AppKit" Selector "addSubview:" (handle As Ptr, view As Ptr)
		    
		    mSubView = CreateVisualEffectView(VisualEffectMaterials.Sidebar, Self.Width, Self.Height)
		    addSubview(Me.Handle, mSubView)
		  #EndIf
		End Sub
	#tag EndEvent


	#tag ExternalMethod, Flags = &h21
		Private Declare Function Alloc Lib "Foundation" Selector "alloc" (classRef As Ptr) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h21
		Private Function CreateVisualEffectView(material As VisualEffectMaterials, width As Integer, height As Integer) As Ptr
		  #If TargetMacOS
		    // Basic
		    Declare Function NSClassFromString Lib "AppKit" (className As CFStringRef) As Ptr
		    
		    // NSVisualEffectView
		    Declare Function initWithFrame Lib "AppKit" Selector "initWithFrame:" (cls As Ptr, frame As NSRect) As Ptr
		    Declare Sub setMaterial Lib "AppKit" Selector "setMaterial:" (cls As Ptr, material As Integer)
		    
		    Var frame As NSRect
		    frame.X = 0
		    frame.Y = 0
		    frame.Width = width
		    frame.Height = height
		    
		    Var viewInstance As Ptr = NSClassFromString("NSVisualEffectView")
		    Var allocatedView As Ptr = Alloc(viewInstance)
		    Var view As Ptr = initWithFrame(allocatedView, frame)
		    setMaterial(view, Integer(VisualEffectMaterials.Sidebar))
		    
		    Return view
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetBundleData(name As String, kit As String = "AppKit") As Ptr
		  Declare Function CFBundleGetBundleWithIdentifier Lib "CoreFoundation" (bundleID As CFStringRef) As Ptr
		  Declare Function CFBundleGetDataPointerForName Lib "CoreFoundation" (bundle As Ptr, symbolName As CFStringRef) As Ptr
		  
		  Var bundle As Ptr = CFBundleGetBundleWithIdentifier("com.apple." + kit)
		  Return CFBundleGetDataPointerForName(bundle, name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resize()
		  #If TargetMacOS
		    // NSView
		    Declare Sub setFrameSize Lib "AppKit" Selector "setFrameSize:" (instance As Ptr, newSize As NSSize)
		    
		    Var newSize As NSSize
		    newSize.width = Self.Width
		    newSize.height = Self.Height
		    
		    setFrameSize(mSubView, newSize)
		  #EndIf
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSubView As Ptr
	#tag EndProperty


	#tag Structure, Name = NSRect, Flags = &h21
		X as CGFloat
		  Y as CGFloat
		  Width as CGFloat
		Height as CGFloat
	#tag EndStructure

	#tag Structure, Name = NSSize, Flags = &h21
		width As CGFloat
		height As CGFloat
	#tag EndStructure


	#tag Enum, Name = VisualEffectMaterials, Flags = &h21
		Titlebar = 3
		  Selection
		  Menu
		  Popover
		  Sidebar
		  HeaderView = 10
		  Sheet
		  WindowBackground
		  HUDWindow
		  FullScreenUI = 15
		  ToolTip = 17
		  ContentBackground
		  UnderWindowBackground = 21
		UnderPageBackground
	#tag EndEnum


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
			InitialValue=""
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
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
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
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
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
			InitialValue="True"
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
			InitialValue="False"
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
	#tag EndViewBehavior
End Class
#tag EndClass
