﻿B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=11
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: True
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.

End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("frmBestellpositionen")

End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub


'zum Löschen
Private Sub lsvBestellpositionen_ItemLongClick (Position As Int, Value As Object)
	
End Sub

Private Sub btnBestellen_Click 'zum Bestellen
	
End Sub


Private Sub lsvLieferant_ItemClick (Position As Int, Value As Object) 'Lieferant auswählen
	
End Sub