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
	Private txtTyp As EditText
	Private txtBeschreibung As EditText
	Private txtPreis As EditText
	Private btnAbbrechen As Button
	Private btnLoeschen As Button
	Private btnSpeichern As Button
	Private imgWare As ImageView
	
	Public mintWarenBezeichnung = AlleWarenMitarbeiterActivity.lblBoxS
	
	Private mstrTyp As String
	Private mstrBeschreibung As String
	Private mdblPreis As Double
	Private mAktuelleWare As Ware
	
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("frmWareMa")
	pnlWareEinzeln.Panel.LoadLayout("pnlWareEinzeln")
	
End Sub

Private Sub ladenDaten()
	' Deklaration
	Dim warenservice As WarenverwaltungServiceService ' Service für den Zugriff auf den Server deklarieren

	' Fortschrittsdialog einblenden
	ProgressDialogShow("Informationen der Ware " & mintWarenBezeichnung & " werden geladen.")

	' Service initialisieren und Operation des Service aufrufen
	warenservice.Initialize(Me)
	warenservice.Verbose = True ' Ausfühliche Ausgabe im Log
	warenservice.gibUrlaubsantragAsync(	mintWarenBezeichnung)
	
	' Wenn diese Stelle in der Prozedur erreicht ist, geht es
	' asynchon in der Prozedur gibUrlaubsantragResponse() weiter,
	' sobald die Daten vom Server eingetroffen sind und verarbeitet wurden
End Sub

Sub WareladenResponse (pWare As Ware)
	' Hier geht es weiter, nachdem service.gibUrlaubsantragAsync() aufgerufen wurde,
	' die Daten vom Server eingetroffen sind und verarbeitet wurden
	
	' Fortschrittsdialog ausblenden
	ProgressDialogHide
	
	' als Parameter erhaltenen Urlaubsantrag als eigenes Attribut speichern
	mAktuelleWare = pWare
	
	' Jetzt kann es mit der Anzeige weitergehen
	anzeigen
End Sub

Public Sub anzeigen
	txtTyp.Text = mAktuelleWare.Typ
	txtPreis.Text = mAktuelleWare.Preis ' Typumwandlung
	txtBeschreibung.Text = mAktuelleWare.Beschreibung ' gibt kein Attribut beschreibung
End Sub

Sub Activity_Resume
	anzeigen
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub


Private Sub btnAbbrechen_Click
	Dim intResult As Int ' Ergebnis des Meldungsfensters
	
	' Rückfrage beim Benutzer, ob er wirklich abbrechen möchte
	intResult = Msgbox2("Möchten Sie wirklich abbrechen?", "Abbrechen", "Ja", "", "Nein", Null)
	If intResult = DialogResponse.POSITIVE Then
		' Wenn ja, dann die Aktivität beenden
		Activity.Finish
	End If
	' In allen anderen Fällen ist nichts zu tun
End Sub

Private Sub btnLoeschen_Click (value As Object)

	Dim warenservice As WarenverwaltungServiceService
	Dim intResult As Int
	
	' Rückfrage beim Benutzer, ob wirlich gelöscht werden soll
	intResult = Msgbox2("Möchten Sie wirklich löschen?", "Löschen", "Ja", "", "Nein", Null)
	If intResult = DialogResponse.NEGATIVE Then
		' Wenn doch nicht, dann Prozedur verlassen
		Return
	End If

	' Wenn gelöscht werden soll, dann die ID des angeklickten Eintrags merken
	mAktuelleWare.ID = value
	
	' Fortschrittsdialog anzeigen
	ProgressDialogShow("Urlaubsantrag wird gelöscht.")
	
	' Service initailiseren und Operation zum löschen aufrufen
	warenservice.Initialize(Me)
	warenservice.Verbose = True ' Ausfühliche Ausgabe im Log
	warenservice.wareLoeschenAsync(mAktuelleWare.ID)
	
	' Wenn diese Stelle in der Prozedur erreicht ist, geht es
	' asynchon in der Prozedur loeschenUrlaubsantragResponse() weiter,
	' sobald die Antwort vom Server eingetroffen ist und verarbeitet wurde
	Activity.Finish
End Sub

Sub loeschenUrlaubsantragResponse()
	
	' Fortschrittsdialog ausblenden
	ProgressDialogHide
	' Daten neu laden, damit der gelöschte Eintrag nicht mehr angezeigt wird
	AlleWarenMitarbeiterActivity.laden
	
	
	
End Sub


Private Sub btnSpeichern_Click
	ubernehmen
	
	speichernOderAbsenden
	
End Sub

Sub ubernehmen
	mAktuelleWare.Typ = txtTyp.Text
	mAktuelleWare.Preis = txtPreis.Text
	mAktuelleWare.Beschreibung = txtBeschreibung.Text ' Gibt noch kein Beschreibungsattribut
End Sub

Sub speichernOderAbsenden()
	' Deklaration
	Dim warenservice As WarenverwaltungServiceService ' Service für den Zugriff auf den Server deklarieren

	' Service initialisieren
	warenservice.Initialize(Me)
	warenservice.CallbackSub  = "gespeichertOderAbgesendetResponse" ' legt fest, welche Prozedur anschließend aufgerufen werden soll
	warenservice.Verbose = True ' Ausfühliche Ausgabe im Log

	' Abhängig davon, ob die ID größer 0 ist, d.h. der Urlaubsantrag ursprünglich vom
	' Server geladen wurde, oder der Urlaubsantrag neu angelegt wurde, muss hier verzweigt werden
	If mAktuelleWare.Id > 0 Then
		' Aktualisieren eines vorhandenen Urlaubsantrags
		' Fortschrittsanzeige einblenden		
		ProgressDialogShow("Informationen der Ware " & mintWarenBezeichnung & " werden gespeichert.")
		' Service aufrufen
		warenservice.wareSpeichernAsync(mAktuelleWare)
	Else
		' Aktualisieren eines vorhandenen Urlaubsantrags
		' Fortschrittsanzeige einblenden		
		ProgressDialogShow("Daten des neuen Urlaubsantrags werden gespeichert.")
		' Service aufrufen
		warenservice.wareHinzufuegenAsync(mAktuelleWare)
	End If
	
	' Hinweis: wenn diese Stelle in der aktuellen Prozedur erreicht ist, 
	' geht es asynchon in der Prozedur gespeichertOderAbgesendetResponse() weiter, weil der
	' Name dieser Prozedur weiter oben als Callback-Sub des Service festgelegt wurde
End Sub

Sub gespeichertOderAbgesendetResponse()
	
	' Hier geht es weiter, nachdem service.aktualisierenUrlaubsantragAsync() oder
	' service.hinzufuegenUrlaubsantragAsync() aufgerufen wurde,
	' die Daten vom Server eingetroffen sind und verarbeitet wurden
	
	' Fortschittsanzeige ausblenden
	ProgressDialogHide
	
	' Zurück zur Übersicht der Urlaubsanträge
	StartActivity(AlleWarenMitarbeiterActivity)
	
	' Diese Aktivität beenden, weil über den Zurück-Button nicht mehr hierher
	' navigiert werden soll
	Activity.Finish
End Sub