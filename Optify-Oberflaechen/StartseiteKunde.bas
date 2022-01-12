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
	Public mintAktWare As Int
End Sub

Sub Globals
	Private lsvAlleWaren As ListView
	Dim warenService As WarenverwaltungServiceService
	
	Private wAlleWaren As WareList
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("frmStartseiteKunde")
	wAlleWaren.Initialize
End Sub

Sub Activity_Resume
	mintAktWare = -1
	ladeWaren
	anzeigenWListe
End Sub

Sub Activity_Pause (UserClosed As Boolean)
End Sub

Sub ladeWaren()
	ProgressDialogShow("Alle Waren werden geladen")
	warenService.Initialize(Me)
	warenService.Verbose = True
	warenService.alleWarenLadenAsync()
End Sub

Public Sub alleWarenLadenResponse(pWarenListe As WareList)
	ProgressDialogHide
	wAlleWaren = pWarenListe
	anzeigenWListe
End Sub

Private Sub anzeigenWListe()
	Dim strZeile1 As String
	Dim strZeile2 As String
	Dim intIndex As Int

	lsvAlleWaren.Clear
	For Each wWare As Ware In wAlleWaren.List
		strZeile1 = wWare.Bezeichnung
		strZeile2 = wWare.Preis
		intIndex = wWare.ID
		
		lsvAlleWaren.AddTwoLines2(strZeile1, strZeile2, intIndex)
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