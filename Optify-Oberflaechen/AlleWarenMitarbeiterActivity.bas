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
	Private mlstAlleWaren As List
	Private lsvAlleWaren As ListView
	Dim warenService As WarenverwaltungServiceService

End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("frmAlleWarenMitarbeiter")
	mlstAlleWaren.Initialize

End Sub

Sub Activity_Resume
	If Not(warenService.IsInitialized) Then
		warenService.Initialize(Me)
		warenService.Verbose = True
	End If
	
	mintAktWare = -1
	anzeigenWListe
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Private Sub anzeigenWListe()
	warenService.alleWarenLadenAsync()
	ProgressDialogShow("Alle Waren werden geladen")
End Sub

Sub alleWarenLadenResponse(pWarenListe As WareList)
	Dim strZeile1 As String
	
	lsvAlleWaren.Clear
	For w = 0 To mlstAlleWaren.Size - 1
		Dim wWare As Ware
		wWare = mlstAlleWaren.Get(w)
		strZeile1 = wWare.Typ
		lsvAlleWaren.AddSingleLine2(strZeile1, wWare.ID)
	Next
End Sub


Private Sub lsvAlleWarenMitarbeiter_ItemClick (Position As Int, Value As Object)
	mintAktWare = Value
	StartActivity(WareEinzelnMaActivity)
End Sub

Private Sub btnHinzufuegen_Click
	StartActivity(WareEinzelnMaActivity)
End Sub

Private Sub lsvAlleWarenMitarbeiter_ItemLongClick (Position As Int, Value As Object)
	Dim intResult As Int
	intResult = Msgbox2("Wirklich löschen?", "Löschen", "Ja", "", "Nein", Null)
	If intResult = DialogResponse.POSITIVE Then
		warenService.wareLoeschenAsync(Value)
		anzeigenWListe
	End If
End Sub