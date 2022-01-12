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

End Sub

Sub Globals
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

