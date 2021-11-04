
Public Class Bestellungverwaltung
    Implements IBestellungverwaltung
    Private db As BestellungEntity

    Function gibBestellungen() As List(Of Bestellung) Implements IBestellungverwaltung.gibBestellungen

    End Function

    Sub BestellungOeffnen(pintBestID As Integer) Implements IBestellungverwaltung.BestellungOeffnen

    End Sub

    Sub BestellungBearbeiten(pBestellung As Bestellung) Implements IBestellungverwaltung.BestellungBearbeiten

    End Sub

    Sub BestellungStornieren(pintBestID As Integer) Implements IBestellungverwaltung.BestellungStornieren

    End Sub

    Sub Bestellungspeichern(pBestellung As Bestellung) Implements IBestellungverwaltung.Bestellungspeichern

    End Sub

End Class
