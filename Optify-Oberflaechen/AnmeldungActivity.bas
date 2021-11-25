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

End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("frmAnmeldung")

End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub


Private Sub btnAnmelden_Click
	StartActivity(StartseiteKunde)
	'Oder MA? Oder Lieferant? Schleife?
	Dim strBenutzername As String
	Dim strPasswort As String
	Dim service As BenutzerServiceService
	
	service. Initialize(Me) 'Serviceklasse muss noch erstellt werden
	service.Verbose = True
	'Bei Bedarf Logging aktivieren oder deaktvier
	strBenutzername = txtBenutzername.Text
	strPasswort = txtPasswort. Text
	service.anmeldenAsync (strBenutzername, strPasswort)
	
	ProgressDialogShow("Anmeldungläuft")
End Sub

sub,anmeldenAsyncResponse(RintID.As.Int)
'ProgessDialogeHide muss noch rein aber geht gerade nicht

If pintID > • Then
StartActivity(MenuActivity)
Activity.Finish

Else
Magbox("Anmeldungfehlgeschlagent", "Anmeldefehler")
End If
End Sub