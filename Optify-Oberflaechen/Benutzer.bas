Type=Class
Version=6
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@

' Class Benutzer
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mintBenutzerID As Int
	Private mstrBenutzername As String
	Private mstrName As String
	Private mstrPasswort As String
	Private mstrTyp As String
	Private mstrVorname As String

End Sub

' Konstruktor
Public Sub Initialize


End Sub

' Properties
' BenutzerID
Public Sub setBenutzerID(value As Int)
	mintBenutzerID = value
End Sub

Public Sub getBenutzerID As Int
	Return mintBenutzerID
End Sub


' Benutzername
Public Sub setBenutzername(value As String)
	mstrBenutzername = value
End Sub

Public Sub getBenutzername As String
	Return mstrBenutzername
End Sub


' Name
Public Sub setName(value As String)
	mstrName = value
End Sub

Public Sub getName As String
	Return mstrName
End Sub


' Passwort
Public Sub setPasswort(value As String)
	mstrPasswort = value
End Sub

Public Sub getPasswort As String
	Return mstrPasswort
End Sub


' Typ
Public Sub setTyp(value As String)
	mstrTyp = value
End Sub

Public Sub getTyp As String
	Return mstrTyp
End Sub


' Vorname
Public Sub setVorname(value As String)
	mstrVorname = value
End Sub

Public Sub getVorname As String
	Return mstrVorname
End Sub


