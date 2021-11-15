B4A=true
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

	Private lblWare1 As Label
	Private lblWare2 As Label
	Private lblWare4 As Label
	Private lblWare5 As Label
	Private lblTitel As Label
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("frmStartseiteKunde")

End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub


Private Sub imgWare1_Click
	StartActivity(WareKundeActivity)
End Sub

Private Sub imgWare2_Click
	StartActivity(WareKundeActivity)
End Sub

Private Sub imgWare3_Click
	StartActivity(WareKundeActivity)
End Sub

Private Sub imgWare4_Click
	StartActivity(WareKundeActivity)
End Sub

Private Sub btnWarenkorb1_Click
	
End Sub

Private Sub btnWarenkorb2_Click
	
End Sub

Private Sub btnWarenkorb4_Click
	
End Sub

Private Sub btnWarenkorb5_Click
	
End Sub

Private Sub autotxtAnzahlWare1_TextChanged (Old As String, New As String)
	
End Sub

Private Sub autotxtAnzahlWare2_TextChanged (Old As String, New As String)
	
End Sub

Private Sub autotxtAnzahlWare4_TextChanged (Old As String, New As String)
	
End Sub

Private Sub autotxtWare5_TextChanged (Old As String, New As String)
	
End Sub