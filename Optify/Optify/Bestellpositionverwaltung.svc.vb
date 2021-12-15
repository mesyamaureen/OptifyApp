Imports System.Data.Entity
Public Class Bestellpositionverwaltung
    Implements IBestellpositionverwaltung
    Private db As New OptifyEntities1
    'showCart

    Public Function gibBestellpositionen() As List(Of Bestellposition) Implements IBestellpositionverwaltung.gibBestellpositionen
        Dim bestPoListe As New List(Of Bestellposition)
        Dim bestPo As Bestellposition
        Dim bestPoEntity As New BestellpositionEntity
        Dim aktBestellung As New Bestellung
        For Each bestPoEntity In db.tblBestellpositionen.ToList
            If bestPoEntity.bestPoBestIdFk = aktBestellung.BestellungID Then
                bestPo = New Bestellposition(bestPoEntity)
                bestPoListe.Add(bestPo)
            End If
        Next
        Return bestPoListe
    End Function

    'addToCart
    Public Function hinzufInWarenkorb(pWare As Ware, paktKunde As Kunde) As Integer Implements IBestellpositionverwaltung.hinzufInWarenkorb
        'Dim wWare As Ware
        Dim bestPoEntity As New BestellpositionEntity
        Dim bestPo As New Bestellposition
        Dim bestBestellung As Bestellung = New Bestellung
        Dim bestEntity As BestellungEntity
        Dim intAnzahl As Integer
        'to check if the Bestellung vorhanden ist
        For Each bestEntity In db.tblBestellungen.ToList
            If bestEntity.bestKunIdFk = paktKunde.BenutzerID Then
                If bestEntity.bestStatus = "Unbezahlt" Then
                    bestBestellung = New Bestellung(bestEntity)
                    Exit For
                Else
                    bestBestellung = New Bestellung
                    bestBestellung.BestellungID = erstellenBestellung(bestBestellung, paktKunde.BenutzerID)
                    Exit For
                End If

            End If
        Next

        If bestBestellung.BestellungID = -1 Then
            bestBestellung.BestellungID = erstellenBestellung(bestBestellung, paktKunde.BenutzerID)
        End If

        'create a new Bestellposition
        If bestPo Is Nothing Then
            Return -1
        End If
        bestPoEntity.bestPoIdPk = bestPo.BestellpositionID
        bestPoEntity.bestPoAnzahl = intAnzahl
        bestPoEntity.bestPoBestIdFk = bestBestellung.BestellungID
        bestPoEntity.bestPoWIdFk = pWare.ID

        db.tblBestellpositionen.Attach(bestPoEntity)
        db.Entry(bestPoEntity).State = EntityState.Added
        db.SaveChanges()
        Return bestPoEntity.bestPoIdPk

    End Function

    Public Function erstellenBestellung(pBestellung As Bestellung, pintKundeID As Integer) As Integer Implements IBestellpositionverwaltung.erstellenBestellung
        Dim bestEntity As BestellungEntity
        If pBestellung Is Nothing Then
            Return -1
        End If
        bestEntity = pBestellung.gibAlsBestEntity
        bestEntity.bestKunIdFk = pintKundeID
        db.tblBestellungen.Attach(bestEntity)
        db.Entry(bestEntity).State = EntityState.Added
        db.SaveChanges()
        Return bestEntity.bestIdPk
    End Function

    'removeFromCart
    Public Sub loeschenBestellposition(pintBestPoId As Integer) Implements IBestellpositionverwaltung.loeschenBestellposition

    End Sub

End Class
