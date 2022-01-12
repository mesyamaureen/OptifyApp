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
	' Oberflächenelemente
	Private txtBenutzername As EditText
	Private txtPasswort As EditText
	
	Dim anmeldungService As AnmeldungsfunktionService
	Private benBenutzer As Benutzer
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("frmAnmeldung")
	anmeldungService.Initialize(Me)
	anmeldungService.Verbose = True

End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Private Sub btnAnmelden_Click
	anmelden(txtBenutzername.Text, txtPasswort.Text)
	'StartActivity

End Sub

Private Sub anmelden(pstrBenutzername As String, pstrPasswort As String)
	ProgressDialogShow("Anmeldung läuft")

	anmeldungService.EinloggenAsync(pstrBenutzername, pstrPasswort)
	
End Sub

Public Sub EinloggenResponse(pbenBenutzer As Benutzer)
	ProgressDialogHide
	benBenutzer.Initialize
	
	If pbenBenutzer.Typ = "Kunde" Then
		StartActivity(StartseiteKunde)
		Else If pbenBenutzer.Typ = "Lieferant" Then
			StartActivity(StartseiteLieferantActivity)
			Else
				StartActivity(StartseiteMitarbeiterActivity)
	End If
	Activity.Finish

End Sub

