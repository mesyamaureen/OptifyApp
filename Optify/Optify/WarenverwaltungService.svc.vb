
Public Class WarenverwaltungService
    Implements IWarenverwaltungService
    Private db As WareEntity = New WareEntity

    Function alleWarenLaden() As List(Of Ware) Implements IWarenverwaltungService.alleWarenLaden
        Dim wListe As List(Of Ware)
        Dim w As Ware
        Dim wEntity As WareEntity

        wListe = New List(Of Ware)
        For Each wEnity In db.tblWare.ToList
            w = New Ware(wEntity)
            wListe.Add(w)
        Next


        Return wListe

    End Function

    Function wareOeffnen(pIntId As Integer) As Ware Implements IWarenverwaltungService.wareOeffnen
        Return Nothing
    End Function

    Sub wareLoeschen() Implements IWarenverwaltungService.wareLoeschen

    End Sub


    Sub wareSpeichern() Implements IWarenverwaltungService.wareSpeichern

    End Sub

    Sub wareHinzufuegen() Implements IWarenverwaltungService.wareHinzufuegen

    End Sub


End Class
