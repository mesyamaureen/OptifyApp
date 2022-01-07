Type=Class
Version=6
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@

' Class Bestellung
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mintBestellungID As Int
	Private mlngDatumBestellung As Long
	Private mintKundenID As Int
	Private mdblPreis As Double
	Private mstrStatus As String

End Sub

' Konstruktor
Public Sub Initialize


End Sub

' Properties
' BestellungID
Public Sub setBestellungID(value As Int)
	mintBestellungID = value
End Sub

Public Sub getBestellungID As Int
	Return mintBestellungID
End Sub


' DatumBestellung
Public Sub setDatumBestellung(value As Long)
	mlngDatumBestellung = value
End Sub

Public Sub getDatumBestellung As Long
	Return mlngDatumBestellung
End Sub


' KundenID
Public Sub setKundenID(value As Int)
	mintKundenID = value
End Sub

Public Sub getKundenID As Int
	Return mintKundenID
End Sub


' Preis
Public Sub setPreis(value As Double)
	mdblPreis = value
End Sub

Public Sub getPreis As Double
	Return mdblPreis
End Sub


' Status
Public Sub setStatus(value As String)
	mstrStatus = value
End Sub

Public Sub getStatus As String
	Return mstrStatus
End Sub


