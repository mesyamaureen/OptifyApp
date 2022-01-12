B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

' Class BestellpositionList
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mlstBestellposition As List

End Sub

' Konstruktor
Public Sub Initialize

	mlstBestellposition.Initialize

End Sub

' Properties
Public Sub getList As List
	Return mlstBestellposition
End Sub

Public Sub setList(plstBestellposition As List)
	mlstBestellposition = plstBestellposition
End Sub

' Listenoperationen
Public Sub get(pintIndex As Int) As Bestellposition
	Return mlstBestellposition.Get(pintIndex)
End Sub

Public Sub add(pBestellposition As Bestellposition)
	mlstBestellposition.Add(pBestellposition)
End Sub

Public Sub remove(pBestellposition As Bestellposition)
	Dim intPos As Int
	intPos = mlstBestellposition.IndexOf(pBestellposition)
	If intPos > -1 Then
		mlstBestellposition.RemoveAt(intPos)
	End If
End Sub

Public Sub getSize() As Int
	Return mlstBestellposition.Size
End Sub

