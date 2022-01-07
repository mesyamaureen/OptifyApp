Type=Class
Version=6
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@

' Class Ware
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mstrBeschreibung As String
	Private mstrBezeichnung As String
	Private mintID As Int
	Private mdblPreis As Double

End Sub

' Konstruktor
Public Sub Initialize


End Sub

' Properties
' Beschreibung
Public Sub setBeschreibung(value As String)
	mstrBeschreibung = value
End Sub

Public Sub getBeschreibung As String
	Return mstrBeschreibung
End Sub


' Bezeichnung
Public Sub setBezeichnung(value As String)
	mstrBezeichnung = value
End Sub

Public Sub getBezeichnung As String
	Return mstrBezeichnung
End Sub


' ID
Public Sub setID(value As Int)
	mintID = value
End Sub

Public Sub getID As Int
	Return mintID
End Sub


' Preis
Public Sub setPreis(value As Double)
	mdblPreis = value
End Sub

Public Sub getPreis As Double
	Return mdblPreis
End Sub


