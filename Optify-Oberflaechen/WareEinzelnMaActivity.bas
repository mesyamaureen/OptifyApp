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
	Private pnlWareEinzeln As Panel
	Private txtTitel As EditText
	Private txtPreis As EditText
	Private btnAbbrechen As Button
	'Private btnLoeschen As Button
	Private btnSpeichern As Button
	Private imgWare As ImageView
	Private txtBeschreibung As EditText
	Private lblPreis As Label
	Private lblWährung As Label
	Private lblBeschreibung As Label
	
	'Public mintWarenBezeichnung = AlleWarenMitarbeiterActivity.lblBoxS
	
	Private mstrTyp As String
	Private mstrBeschreibung As String
	Private mdblPreis As Double
	Private mAktuelleWare As Ware
	Private mintIndex As Int
	Dim warenservice As WarenverwaltungServiceService
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("frmWareMa")
	'pnlWareEinzeln.Panel.LoadLayout("pnlWareEinzeln")
	
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

'Private Sub uebernehmen()
'	mAktuelleWare.Bezeichnung = txtTitel.Text
'	mAktuelleWare.Preis = txtPreis.Text
'	mAktuelleWare.Beschreibung = txtBeschreibung.Text
'End Sub

Private Sub btnAbbrechen_Click
	Dim intResult As Int ' Ergebnis des Meldungsfensters
	
	' Rückfrage beim Benutzer, ob er wirklich abbrechen möchte
	intResult = Msgbox2("Möchten Sie wirklich abbrechen?", "Abbrechen", "Ja", "", "Nein", Null)
	If intResult = DialogResponse.POSITIVE Then
		' Wenn ja, dann die Aktivität beenden
		StartActivity(AlleWarenMitarbeiterActivity)
		Activity.Finish
	End If
	' In allen anderen Fällen ist nichts zu tun
End Sub


Sub btnSpeichern_Click
	speichern
'	uebernehmen
'	speichernOderhinzufuegen
'	Activity.Finish
End Sub

Sub speichern
	mAktuelleWare.Initialize
	mAktuelleWare.ID = AlleWarenMitarbeiterActivity.mintAktWare
	mAktuelleWare.Bezeichnung = txtTitel.Text
	mAktuelleWare.Preis = txtPreis.Text
	mAktuelleWare.Beschreibung = txtBeschreibung.Text
	
	warenservice.wareSpeichernAsync(mAktuelleWare)
	ProgressDialogShow2("Daten werden gespeichert", False)
End Sub

Public Sub wareSpeichernResponse()
	ProgressDialogHide
	StartActivity(AlleWarenMitarbeiterActivity)
	Activity.Finish
End Sub




'Sub speichernOderhinzufuegen()
'	warenservice.Initialize(Me)
'	warenservice.CallbackSub = "speichernOderhinzufuegenResponse"
'	warenservice.Verbose = True
'	
'	If mAktuelleWare.ID > 0 Then
'		ProgressDialogShow("Daten der Ware werden gespeichert.")
'		warenservice.wareSpeichernAsync(mAktuelleWare)
'		Else
'			ProgressDialogShow("Daten der neuen Ware werden gespeichert.")
'			warenservice.wareHinzufuegenAsync(mAktuelleWare)
'	End If
'End Sub
'
'Public Sub speichernOderhinzufuegenResponse()
'	ProgressDialogHide
'	StartActivity(AlleWarenMitarbeiterActivity)
'End Sub

'Sub speichernOderhinzufuegen()
'	If mAktuelleWare.ID > 0 Then
'		speichern
'		Else
'			hinzufuegen
'	End If
'End Sub
'
'Sub speichern()
'	ProgressDialogShow("Daten der Ware mit ID " & mintIndex & " werden gespeichert.")
''	warenservice.Initialize(Me)
'	'warenservice.CallbackSub = "wareSpeichernResponse"
'	'warenservice.Verbose = True
'	warenservice.wareSpeichernAsync(mAktuelleWare)
'End Sub
'
'Public Sub wareSpeichernResponse(pWare As Ware)
'	ProgressDialogHide
'	mAktuelleWare = pWare
'	StartActivity(AlleWarenMitarbeiterActivity)
'	Activity.Finish
'End Sub
'
'Sub hinzufuegen()
'	ProgressDialogShow("Daten der neuen Ware werden gespeichert.")
'	warenservice.Initialize(Me)
'	warenservice.CallbackSub = "wareHinzufuegenResponse"
'	warenservice.Verbose = True
'	warenservice.wareHinzufuegenAsync(mAktuelleWare)
'End Sub
'
'Public Sub wareHinzufuegenResponse(pintWareId As Int)
'	ProgressDialogHide
'	StartActivity(AlleWarenMitarbeiterActivity)
'	Activity.Finish
'End Sub