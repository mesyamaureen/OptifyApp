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
	
	Activity.LoadLayout("frmAlleWarenMitarbeiter")

End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Private Sub laden()
	' Deklaration
	Dim wareservice As WarenverwaltungServiceService ' Service für den Zugriff auf den Server deklarieren

	' Fortschrittsdialog einblenden
	ProgressDialogShow("Alle Waren werden geladen.")
	
	' Service initialisieren und Operation des Service aufrufen
	wareservice.Initialize(Me)
	wareservice.Verbose = True ' Ausfühliche Ausgabe im Log
	wareservice.alleWarenLadenAsync()

	
End Sub

Private Sub ImgBoxXS_Click
	StartActivity(WareEinzelnMaActivity)
End Sub

Private Sub ImgBoxS_Click
	StartActivity(WareEinzelnMaActivity)
End Sub

Private Sub ImgBoxM_Click
	StartActivity(WareEinzelnMaActivity)
End Sub

Private Sub ImgBoxL_Click
	StartActivity(WareEinzelnMaActivity)
End Sub

Private Sub ImgBoxXL_Click
	StartActivity(WareEinzelnMaActivity)
End Sub