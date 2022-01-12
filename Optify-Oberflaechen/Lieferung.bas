B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

' Class Lieferung
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mlngAnfangDatum As Long
	Private mintBestellungID As Int
	Private mlngEndeDatum As Long
	Private mintLieferantID As Int
	Private mintLieferungID As Int

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


' BestellungID
Public Sub setBestellungID(value As Int)
	mintBestellungID = value
End Sub

Public Sub getBestellungID As Int
	Return mintBestellungID
End Sub


' EndeDatum
Public Sub setEndeDatum(value As Long)
	mlngEndeDatum = value
End Sub

Public Sub getEndeDatum As Long
	Return mlngEndeDatum
End Sub


' LieferantID
Public Sub setLieferantID(value As Int)
	mintLieferantID = value
End Sub

Public Sub getLieferantID As Int
	Return mintLieferantID
End Sub


' LieferungID
Public Sub setLieferungID(value As Int)
	mintLieferungID = value
End Sub

Public Sub getLieferungID As Int
	Return mintLieferungID
End Sub


