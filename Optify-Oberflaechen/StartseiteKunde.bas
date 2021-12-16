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
	Private mintAktWare As Int
End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Private mlstAlleWaren As List
	Private lsvAlleWaren As ListView
	Dim warenService As WarenverwaltungServiceService
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("frmStartseiteKunde")
	mlstAlleWaren.Initialize
End Sub

Sub Activity_Resume
	mintAktWare = -1
	anzeigenWListe
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Private Sub anzeigenWListe()
	warenService.alleWarenLadenAsync()
	ProgressDialogShow("Alle Waren werden geladen")
End Sub

Sub gibAlleWarenResponse(pWarenListe As WareList)
	Dim strZeile1 As String
	
	lsvAlleWaren.Clear
	For w = 0 To mlstAlleWaren.Size - 1
		Dim wWare As Ware
		wWare = mlstAlleWaren.Get(w)
		strZeile1 = wWare.Typ
		lsvAlleWaren.AddSingleLine2(strZeile1, wWare.ID)
	Next
End Sub

Private Sub lsvAlleWaren_ItemClick (Position As Int, Value As Object)
	mintAktWare = Value
	StartActivity(WareKundeActivity)
End Sub

Private Sub btnWarenkorb_Click
	StartActivity(BestellpositionActivity)
End Sub

Private Sub btnMeinProfil_Click
	
End Sub

Private Sub btnMeineBestellungen_Click
	StartActivity(MeineBestellungenKunde)
End Sub