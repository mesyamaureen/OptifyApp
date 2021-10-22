
Public Class WarenverwaltungService
    Implements IWarenverwaltungService

    Function alleWarenLaden() As List(Of Ware) Implements IWarenverwaltungService.alleWarenLaden
        Return Nothing
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
