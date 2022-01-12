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
	Public mintIndex As Int
End Sub

Sub Globals
Private lblBeschreibung As Label
Private imgWare As ImageView
Private lblTitel As Label
Private btnAbbrechen As Button 
Private autotxtAnzahl As AutoCompleteEditText
Private btnWarenkorb As Button
Private lblPreis As Label
Private lblWährung As Label
Private lblPreisBetrag As Label

Public mAktuelleWare As Ware
Private wareService As WarenverwaltungServiceService
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("frmWareKunde")
	If FirstTime Then
		wareService.Initialize(Me)
		wareService.Verbose = True
	End If
	
	mintIndex = StartseiteKunde.mintAktWare
	mAktuelleWare.Initialize
	
	If mintIndex > 0 Then
		ladenDaten
		Else
			anzeigen
	End If
End Sub

Sub Activity_Resume
	anzeigen
End Sub

Sub Activity_Pause (UserClosed As Boolean)
End Sub

Private Sub ladenDaten()	
	ProgressDialogShow("Ware wird geladen.")
	wareService.wareOeffnenAsync(mintIndex)
End Sub

Public Sub wareOeffnenResponse (pWare As Ware)
	ProgressDialogHide
	mAktuelleWare = pWare
	anzeigen
End Sub

Public Sub anzeigen()
	lblTitel.Text = mAktuelleWare.Bezeichnung
	lblPreisBetrag.Text = mAktuelleWare.Preis
	lblBeschreibung.Text = mAktuelleWare.Beschreibung
	lblWährung.Text = "€"
End Sub

Private Sub btnAbbrechen_Click
	Activity.Finish
End Sub

Private Sub btnWarenkorb_Click
	StartActivity(BestellpositionActivity)
End Sub