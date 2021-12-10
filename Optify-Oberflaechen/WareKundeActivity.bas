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
Private lblBeschreibung As Label
Private imgWare As ImageView
Private lblTitel As Label
Private btnAbbrechen As Button 
Private auotxtAnzahl As AutoCompleteEditText
Private btnWarenkorb As Button
Private lblPreis As Label
Private lbWährung As Label
Private txtPreis As EditText

Public mintWarenBezeichnung = AlleWarenMitarbeiterActivity.lblBoxS
Private mstrTyp As String
Private mstrBeschreibung As String
Private mdblPreis As Double
Private mAktuelleWare As Ware
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("frmWareKunde")

End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

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
	lblTitel.Text = mAktuelleWare.Typ
	txtPreis.Text = mAktuelleWare.Preis
	lblBeschreibung.Text = mAktuelleWare.Beschreibung ' gibt kein Attribut beschreibung
	lbWährung.Text = "€"

End Sub
Private Sub btnAbbrechen_Click
	Activity.Finish
End Sub



Private Sub btnWarenkorb_Click
	
End Sub