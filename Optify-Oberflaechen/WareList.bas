B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

' Class WareList
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mlstWare As List

End Sub

' Konstruktor
Public Sub Initialize

	mlstWare.Initialize

End Sub

' Properties
Public Sub getList As List
	Return mlstWare
End Sub

Public Sub setList(plstWare As List)
	mlstWare = plstWare
End Sub

' Listenoperationen
Public Sub get(pintIndex As Int) As Ware
	Return mlstWare.Get(pintIndex)
End Sub

Public Sub add(pWare As Ware)
	mlstWare.Add(pWare)
End Sub

Public Sub remove(pWare As Ware)
	Dim intPos As Int
	intPos = mlstWare.IndexOf(pWare)
	If intPos > -1 Then
		mlstWare.RemoveAt(intPos)
	End If
End Sub

Public Sub getSize() As Int
	Return mlstWare.Size
End Sub

