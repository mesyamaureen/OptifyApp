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
	Public mintAktWare As Int
End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Private mlstAlleWaren As WareList
	Private btnHinzufuegen As Button
	
	Dim warenService As WarenverwaltungServiceService

	Private lsvAlleWarenMitarbeiter As ListView
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("frmAlleWarenMitarbeiter")
	mlstAlleWaren.Initialize
	
	warenService.Initialize(Me)
	warenService.Verbose = True

End Sub

Sub Activity_Resume
	mintAktWare = -1
	laden
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Private Sub laden()
	ProgressDialogShow("Alle Waren werden geladen")
	warenService.alleWarenLadenAsync()
End Sub

Public Sub alleWarenLadenResponse(pWarenListe As WareList)
	ProgressDialogHide
	mlstAlleWaren = pWarenListe
	
	anzeigen
End Sub

Private Sub anzeigen()
		Dim strZeile1 As String
	Dim strZeile2 As String
	Dim intIndex As Int
	ProgressDialogHide
	
	lsvAlleWarenMitarbeiter.Clear
	For Each wWare As Ware In mlstAlleWaren.List
		strZeile1 = wWare.Bezeichnung
		strZeile2 = wWare.Preis
		intIndex = wWare.ID
		
		lsvAlleWarenMitarbeiter.AddTwoLines2(strZeile1, strZeile2, intIndex)
	Next
	
End Sub

Private Sub lsvAlleWarenMitarbeiter_ItemClick (Position As Int, Value As Object)
	mintAktWare = Value
	StartActivity(WareEinzelnMaActivity)
End Sub

Private Sub btnHinzufuegen_Click
	mintAktWare = -1
	StartActivity(WareEinzelnMaActivity)
End Sub

Private Sub lsvAlleWarenMitarbeiter_ItemLongClick (Position As Int, Value As Object)
	Dim intResult As Int
	intResult = Msgbox2("Wirklich löschen?", "Löschen", "Ja", "", "Nein", Null)
	If intResult = DialogResponse.POSITIVE Then
		warenService.wareLoeschenAsync(Value)
		anzeigen
	End If
End Sub