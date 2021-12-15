Type=Class
Version=6
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@

' Class Lieferung
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mlngAnfangDatum As Long
	Private mintBestellung As Int
	Private mlngEndeDatum As Long
	Private mintID As Int

End Sub

' Konstruktor
Public Sub Initialize


End Sub

' Properties
' AnfangDatum
Public Sub setAnfangDatum(value As Long)
	mlngAnfangDatum = value
End Sub

Public Sub getAnfangDatum As Long
	Return mlngAnfangDatum
End Sub


' Bestellung
Public Sub setBestellung(value As Int)
	mintBestellung = value
End Sub

Public Sub getBestellung As Int
	Return mintBestellung
End Sub


' EndeDatum
Public Sub setEndeDatum(value As Long)
	mlngEndeDatum = value
End Sub

Public Sub getEndeDatum As Long
	Return mlngEndeDatum
End Sub


' ID
Public Sub setID(value As Int)
	mintID = value
End Sub

Public Sub getID As Int
	Return mintID
End Sub


