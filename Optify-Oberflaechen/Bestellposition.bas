Type=Class
Version=6
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@

' Class Bestellposition
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mintAnzahl As Int
	Private mintBestellpositionID As Int
	Private mintBestellungID As Int
	Private mintWareID As Int

End Sub

' Konstruktor
Public Sub Initialize


End Sub

' Properties
' Anzahl
Public Sub setAnzahl(value As Int)
	mintAnzahl = value
End Sub

Public Sub getAnzahl As Int
	Return mintAnzahl
End Sub


' BestellpositionID
Public Sub setBestellpositionID(value As Int)
	mintBestellpositionID = value
End Sub

Public Sub getBestellpositionID As Int
	Return mintBestellpositionID
End Sub


' BestellungID
Public Sub setBestellungID(value As Int)
	mintBestellungID = value
End Sub

Public Sub getBestellungID As Int
	Return mintBestellungID
End Sub


' WareID
Public Sub setWareID(value As Int)
	mintWareID = value
End Sub

Public Sub getWareID As Int
	Return mintWareID
End Sub


