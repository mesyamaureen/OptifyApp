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

	Private lsvBestellpositionen As ListView
	Private lsvLieferant As ListView
	Private btnBestellen As Button
	Public mintAusgewaehlteWare As Int
	Public mintAusgewaehlteLieferant As Int
	
	Private mlstBestellpositionen As BestellpositionList
	Private mlstLieferanten As LieferantList
	Private bestpoService As BestellpositionverwaltungService
	
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("frmBestellpositionen")
	mlstBestellpositionen.Initialize
	mlstLieferanten.Initialize
	
	bestpoService.Initialize(Me)
	bestpoService.Verbose = True
	
End Sub

Sub Activity_Resume
	ladenBestellposition
	ladenLieferanten
	anzeigenBestellposition
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Private Sub ladenBestellposition()
	ProgressDialogShow("Warenkorb wird aktualisiert")
	mintAusgewaehlteWare = WareKundeActivity.mintIndex
	bestpoService.gibBestellpositionenAsync(mintAusgewaehlteWare)
End Sub

Public Sub gibBestellpositionenResponse(pintId As Int)
	ProgressDialogHide
	Dim bestBestellung As Bestellung
	bestBestellung.Initialize
	pintId = bestBestellung.BestellungID
	If pintId > 0 Then
		anzeigenBestellposition
		Else
			Msgbox("Warenkorb ist leer", "Achtung")
	End If
End Sub

Private Sub ladenLieferanten()
	bestpoService.gibLieferantenAsync
End Sub

Private Sub anzeigenBestellposition()
	Dim strBestpoZeile1 As String
	Dim strBestpoZeile2 As String
	Dim intBestpoId As Int
	
	lsvBestellpositionen.Clear
	
	For Each bestpo As Bestellposition In mlstBestellpositionen.List
		strBestpoZeile1 = bestpo.WareID
		strBestpoZeile2 = bestpo.Anzahl
		intBestpoId = bestpo.WareID
		lsvBestellpositionen.AddTwoLines2(strBestpoZeile1, strBestpoZeile2, intBestpoId)
	Next
	
End Sub

'zum Löschen
Private Sub lsvBestellpositionen_ItemLongClick (Position As Int, Value As Object)
	
End Sub

Private Sub btnBestellen_Click 'zum Bestellen
	
End Sub


Private Sub lsvLieferant_ItemClick (Position As Int, Value As Object) 'Lieferant auswählen
	
End Sub