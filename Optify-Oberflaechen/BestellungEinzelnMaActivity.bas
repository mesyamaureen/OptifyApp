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

	Private pnlBestellungEinzelnMa As Panel
	Private txtId As EditText
	Private txtDatum As EditText
	Private txtPreis As EditText
	Private txtStatus As EditText
	Private txtKunde As EditText
	Private lsvWaren As ListView
	Private btnSpeichern As Button
	Private btnStornieren As Button
	
	Private mAktBestellung As Bestellung
	Private mintIndex As Int
	Private bestservice As BestellungverwaltungService
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("frmbestellungEinzelnMa")
	
	
	bestservice.Initialize(Me)
	bestservice.Verbose = True
	
	mintIndex = AlleBestellungenMitarbeiterActivity.mintAktBestellung
	mAktBestellung.Initialize
End Sub

Sub Activity_Resume
	laden
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub


Private Sub laden()
	bestservice.Initialize(Me)
	bestservice.Verbose = True
	bestservice.BestellungOeffnenAsync(mintIndex)
	ProgressDialogShow2("Die Ware wird geladen.", False)
End Sub

Public Sub BestellungOeffnenResponse(pBest As Bestellung)
	ProgressDialogHide
	mAktBestellung = pBest
	anzeigen
End Sub

Private Sub anzeigen()
txtId.Text = NumberFormat(mAktBestellung.BestellungID, 0, 0)
txtDatum.Text = DateTime.Date(mAktBestellung.DatumBestellung)
txtPreis.Text = NumberFormat(mAktBestellung.Preis, 0, 2)
txtStatus.Text = mAktBestellung.Status
txtKunde.Text = NumberFormat(mAktBestellung.KundenID, 0, 0)  
'how to refer to the warenliste of a kunde?
ProgressDialogHide
End Sub

Private Sub btnSpeichern_Click
	speichern
	Dim lngDatum As Long
	lngDatum = DateTime.DateParse(txtDatum.Text)
	mAktBestellung.Initialize
	mAktBestellung.BestellungID = txtId.Text
	mAktBestellung.DatumBestellung = lngDatum
	mAktBestellung.Preis = txtPreis.Text
	mAktBestellung.Status = txtStatus.Text
	mAktBestellung.KundenID = txtKunde.Text
	
	bestservice.BestellungspeichernAsync(mAktBestellung)
End Sub

Sub speichern()
	bestservice.Initialize(Me)
	bestservice.Verbose = True
	
	Dim lngDatum As Long
	lngDatum = DateTime.DateParse(txtDatum.Text)
	
	mAktBestellung.Initialize
	mAktBestellung.BestellungID = txtId.Text
	mAktBestellung.DatumBestellung = lngDatum
	mAktBestellung.Preis = txtPreis.Text
	mAktBestellung.Status = txtStatus.Text
	mAktBestellung.KundenID = txtKunde.Text
	
	bestservice.BestellungspeichernAsync(mAktBestellung)
	ProgressDialogShow2("Daten werden gespeichert", False)
End Sub

Public Sub BestellungspeichernResponse()
	ProgressDialogHide
	StartActivity(AlleBestellungenMitarbeiterActivity)
	Activity.Finish
	
End Sub