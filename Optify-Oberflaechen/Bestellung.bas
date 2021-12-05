B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

' Class Bestellung
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mintBestellungID As Int
	Private mlngDatumBestellung As Long
	Private mdecPreis As BigDecimal
	Private mstrStatus As String
	Private mintWaren As Int

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


' Preis
Public Sub setPreis(value As BigDecimal)
	mdecPreis = value
End Sub

Public Sub getPreis As BigDecimal
	Return mdecPreis
End Sub


' Status
Public Sub setStatus(value As String)
	mstrStatus = value
End Sub

Public Sub getStatus As String
	Return mstrStatus
End Sub


' Waren
Public Sub setWaren(value As Int)
	mintWaren = value
End Sub

Public Sub getWaren As Int
	Return mintWaren
End Sub


