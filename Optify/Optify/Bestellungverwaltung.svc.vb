
Public Class Bestellungverwaltung
    Implements IBestellungverwaltung
    Private db As OptifyDBEntities = New OptifyDBEntities

    Public Function gibBestellungen() As List(Of Bestellung) Implements IBestellungverwaltung.gibBestellungen
        Dim bestListe As List(Of Bestellung)
        Dim best As Bestellung
        bestListe = New List(Of Bestellung)
        For Each bestEntity In db.tblBestellungen.ToList
            best = New Bestellung(bestEntity)
            bestListe.Add(best)
        Next
        Return bestListe
    End Function

    Public Function BestellungOeffnen(pintBestID As Integer) Implements IBestellungverwaltung.BestellungOeffnen
        Dim best As Bestellung
        Dim bestEntity As BestellungEntity
        bestEntity = db.tblBestellungen.Find(pintBestID)
        best = New Bestellung(bestEntity)
        Return best
    End Function

    Sub BestellungBearbeiten(pBestellung As Bestellung) Implements IBestellungverwaltung.BestellungBearbeiten
        'Bestellung in der Datenbank
        'Augewählte Bestellung in der Datenbank vergleichen
        'Ausgewählte Bestellung in der Datenbank liefern
        'Änderungen vornehmen
        'Änderungen speichern
        'Geänderte Bestellung in die Datenbank zurückliefern
    End Sub

    Sub BestellungStornieren(pintBestID As Integer) Implements IBestellungverwaltung.BestellungStornieren

    End Sub

    Sub Bestellungspeichern(pBestellung As Bestellung) Implements IBestellungverwaltung.Bestellungspeichern

    End Sub

End Class
