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
	Public mintAktBestellung As Int
End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Private lsvAlleBestellungenMA As ListView
	
	Private mlstBestellungen As BestellungList
	Private mBestellung As Bestellung
	Private bestservice As BestellungverwaltungService
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("frmAlleBestellungenMa")
	
	mlstBestellungen.Initialize
	bestservice.Initialize(Me)
	bestservice.Verbose = True
End Sub

Sub Activity_Resume
	laden
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Public Sub laden()
	bestservice.Initialize(Me)
	bestservice.Verbose = True
	bestservice.alleBestellungenLadenAsync()
	ProgressDialogShow("Alle Bestellungen werden geladen")
End Sub

Public Sub alleBestellungenLadenResponse(plstBestellungen As BestellungList)
	ProgressDialogHide
	mlstBestellungen = plstBestellungen
	
	anzeigen
End Sub

Private Sub anzeigen()
	Dim strZeile1 As String
	Dim strZeile2 As String
	Dim intIndex As Int
	ProgressDialogHide
	
	lsvAlleBestellungenMA.Clear
	For Each bestBestellung As Bestellung In mlstBestellungen.List
		strZeile1 = bestBestellung.BestellungID
		strZeile2 = bestBestellung.Status
		intIndex = bestBestellung.BestellungID
		
		lsvAlleBestellungenMA.AddTwoLines2(strZeile1, strZeile2, intIndex)
	Next
End Sub

Private Sub lsvAlleBestellungenMA_ItemClick (Position As Int, Value As Object)
	mintAktBestellung = Value
	StartActivity(BestellungEinzelnMaActivity)
End Sub

Private Sub lsvAlleBestellungenMA_ItemLongClick (Position As Int, Value As Object)
	Dim intId As Int
	Dim intResult As Int

	bestservice.Initialize(Me)
	bestservice.Verbose = True
	
	intResult = Msgbox2("Möchten Sie wirklich löschen?", "Löschen", "Ja", "", "Nein", Null)
	If intResult = DialogResponse.NEGATIVE Then
		Return
	End If
	
	intId = Value
	bestservice.BestellungStornierenAsync(intId)
	ProgressDialogShow2("Daten werden gelöscht.", False)
	
End Sub

Public Sub BestellungStornierenResponse()
	ProgressDialogHide
	laden
End Sub