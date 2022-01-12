B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

' Class LieferungList
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attributdeklarationen
Sub Class_Globals

	Private mlstLieferung As List

End Sub

' Konstruktor
Public Sub Initialize

	mlstLieferung.Initialize

End Sub

' Properties
Public Sub getList As List
	Return mlstLieferung
End Sub

Public Sub setList(plstLieferung As List)
	mlstLieferung = plstLieferung
End Sub

' Listenoperationen
Public Sub get(pintIndex As Int) As Lieferung
	Return mlstLieferung.Get(pintIndex)
End Sub

Public Sub add(pLieferung As Lieferung)
	mlstLieferung.Add(pLieferung)
End Sub

Public Sub remove(pLieferung As Lieferung)
	Dim intPos As Int
	intPos = mlstLieferung.IndexOf(pLieferung)
	If intPos > -1 Then
		mlstLieferung.RemoveAt(intPos)
	End If
End Sub

Public Sub getSize() As Int
	Return mlstLieferung.Size
End Sub

