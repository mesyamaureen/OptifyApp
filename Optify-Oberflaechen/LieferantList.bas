Type=Class
Version=6
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@

' Class LieferantList
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mlstLieferant As List

End Sub

' Konstruktor
Public Sub Initialize

	mlstLieferant.Initialize

End Sub

' Properties
Public Sub getList As List
	Return mlstLieferant
End Sub

Public Sub setList(plstLieferant As List)
	mlstLieferant = plstLieferant
End Sub

' Listenoperationen
Public Sub get(pintIndex As Int) As Lieferant
	Return mlstLieferant.Get(pintIndex)
End Sub

Public Sub add(pLieferant As Lieferant)
	mlstLieferant.Add(pLieferant)
End Sub

Public Sub remove(pLieferant As Lieferant)
	Dim intPos As Int
	intPos = mlstLieferant.IndexOf(pLieferant)
	If intPos > -1 Then
		mlstLieferant.RemoveAt(intPos)
	End If
End Sub

Public Sub getSize() As Int
	Return mlstLieferant.Size
End Sub

