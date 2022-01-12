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
	Private pnlWareEinzeln As Panel
	Private txtTitel As EditText
	Private txtPreis As EditText
	Private btnAbbrechen As Button
	Private btnSpeichern As Button
	Private imgWare As ImageView
	Private txtBeschreibung As EditText
	Private lblPreis As Label
	Private lblWährung As Label
	Private lblBeschreibung As Label
	
	Private mAktuelleWare As Ware
	Private mintIndex As Int
	Dim warenservice As WarenverwaltungServiceService
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("frmWareMa")
	warenservice.Initialize(Me)
	warenservice.Verbose = True
	mintIndex = AlleWarenMitarbeiterActivity.mintAktWare
	mAktuelleWare.Initialize
	If mintIndex > 0 Then
		laden
		Else
			anzeigen
	End If
End Sub

Sub Activity_Resume
End Sub

Sub Activity_Pause (UserClosed As Boolean)
End Sub

Private Sub laden()
	ProgressDialogShow("Die Ware wird geladen.")
	warenservice.wareOeffnenAsync(mintIndex)
End Sub

Public Sub wareOeffnenResponse(pWare As Ware)
	ProgressDialogHide
	mAktuelleWare = pWare
	anzeigen
End Sub

Public Sub anzeigen()
	txtTitel.Text = mAktuelleWare.Bezeichnung
	txtPreis.Text = mAktuelleWare.Preis
	txtBeschreibung.Text = mAktuelleWare.Beschreibung
End Sub

Private Sub btnAbbrechen_Click
	Dim intResult As Int 
	intResult = Msgbox2("Möchten Sie wirklich abbrechen?", "Abbrechen", "Ja", "", "Nein", Null)
	If intResult = DialogResponse.POSITIVE Then
		StartActivity(AlleWarenMitarbeiterActivity)
		Activity.Finish
	End If
End Sub


Sub btnSpeichern_Click
	speichern
End Sub

Sub speichern
	mAktuelleWare.Initialize
	mAktuelleWare.ID = AlleWarenMitarbeiterActivity.mintAktWare
	mAktuelleWare.Bezeichnung = txtTitel.Text
	mAktuelleWare.Preis = txtPreis.Text
	mAktuelleWare.Beschreibung = txtBeschreibung.Text
	
	If AlleWarenMitarbeiterActivity.mintAktWare > 0 Then
		warenservice.wareSpeichernAsync(mAktuelleWare)
		ProgressDialogShow2("Daten werden gespeichert", False)
		Else
			warenservice.wareHinzufuegenAsync(mAktuelleWare)
			ProgressDialogShow2("Neue Daten werden gespeichert", False)
	End If
End Sub

Public Sub wareSpeichernResponse()
	ProgressDialogHide
	StartActivity(AlleWarenMitarbeiterActivity)
	Activity.Finish
End Sub

Public Sub wareHinzufuegenResponse(pintWareId As Int)
	ProgressDialogHide
	mAktuelleWare.ID = pintWareId
	StartActivity(AlleWarenMitarbeiterActivity)
	Activity.Finish
End Sub