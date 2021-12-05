B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

' Class BestellungList
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mlstBestellung As List

End Sub

' Konstruktor
Public Sub Initialize

	mlstBestellung.Initialize

End Sub

' Properties
Public Sub getList As List
	Return mlstBestellung
End Sub

Public Sub setList(plstBestellung As List)
	mlstBestellung = plstBestellung
End Sub

' Listenoperationen
Public Sub get(pintIndex As Int) As Bestellung
	Return mlstBestellung.Get(pintIndex)
End Sub

Public Sub add(pBestellung As Bestellung)
	mlstBestellung.Add(pBestellung)
End Sub

Public Sub remove(pBestellung As Bestellung)
	Dim intPos As Int
	intPos = mlstBestellung.IndexOf(pBestellung)
	If intPos > -1 Then
		mlstBestellung.RemoveAt(intPos)
	End If
End Sub

Public Sub getSize() As Int
	Return mlstBestellung.Size
End Sub

