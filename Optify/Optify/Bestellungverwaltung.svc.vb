Imports System.Data.Entity
Public Class Bestellungverwaltung
    Implements IBestellungverwaltung
    Private db As OptifyEntities1 = New OptifyEntities1

    Public Function alleBestellungenLaden() As List(Of Bestellung) Implements IBestellungverwaltung.alleBestellungenLaden
        Dim bestListe As List(Of Bestellung)
        Dim best As Bestellung
        Dim bestEntity As BestellungEntity
        bestListe = New List(Of Bestellung)
        For Each bestEntity In db.tblBestellungen.ToList
            best = New Bestellung(bestEntity)
            bestListe.Add(best) 'Alle Bestellungen in die Liste hinzufügen
        Next
        Return bestListe
    End Function


    Public Function BestellungOeffnen(pintBestID As Integer) As Bestellung Implements IBestellungverwaltung.BestellungOeffnen
        'Deklaration
        Dim best As Bestellung
        Dim bestEntity As BestellungEntity

        'Suchen nach einer Bestellung in der Datenbank mit übergegebenen ID
        bestEntity = db.tblBestellungen.Find(pintBestID)
        'Prüfen, ob in der Datenbank eine Bestellung mit der übergegebenen ID vorhanden ist
        If bestEntity Is Nothing Then
            Return Nothing
        End If

        'ansonsten die Bestellung aus der Db in ein Objekt der Modelklasse überführen
        best = New Bestellung(bestEntity)
        'Bestellung zurückgeben
        Return best
    End Function


    Sub BestellungStornieren(pintBestID As Integer) Implements IBestellungverwaltung.BestellungStornieren
        Dim bestEntity As BestellungEntity
        bestEntity = db.tblBestellungen.Find(pintBestID)
        If bestEntity Is Nothing Then
            Exit Sub
        End If
        db.tblBestellungen.Attach(bestEntity)
        db.Entry(bestEntity).State = EntityState.Deleted
        db.SaveChanges()
    End Sub


    Sub Bestellungspeichern(pBestellung As Bestellung) Implements IBestellungverwaltung.Bestellungspeichern
        'Deklaration
        Dim bestEntity As BestellungEntity

        'Prüfen, ob eine Bestellung übergeben wurde
        If pBestellung Is Nothing Then
            Exit Sub
        End If

        'Übergegebene Bestellung in ein Entity umwandeln
        bestEntity = pBestellung.gibAlsBestEntity
        'Bestellungentity mit der Db bekannt machen und speichern
        db.tblBestellungen.Attach(bestEntity)
        db.Entry(bestEntity).State = EntityState.Modified
        db.SaveChanges()
    End Sub

    'BestellungHinzufügen
End Class
