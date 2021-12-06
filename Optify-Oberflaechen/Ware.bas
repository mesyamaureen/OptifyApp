B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

' Class Ware
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mintID As Int
	Private mdblPreis As Double
	Private mstrTyp As String

End Sub

' Konstruktor
Public Sub Initialize


End Sub

' Properties
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


' Typ
Public Sub setTyp(value As String)
	mstrTyp = value
End Sub

Public Sub getTyp As String
	Return mstrTyp
End Sub


