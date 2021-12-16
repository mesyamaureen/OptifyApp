Imports System.Data.Entity
Public Class Bestellpositionverwaltung
    Implements IBestellpositionverwaltung
    Private db As New OptifyEntities1

    'beim Klicken "Warenkorb"
    Public Function gibBestellpositionen(pintBestID As Integer) As List(Of Bestellposition) Implements IBestellpositionverwaltung.gibBestellpositionen
        Dim bestPoListe As New List(Of Bestellposition)
        Dim bestPo As Bestellposition
        Dim bestPoEntity As New BestellpositionEntity
        'Dim aktBestellung As New Bestellung
        For Each bestPoEntity In db.tblBestellpositionen.ToList
            If bestPoEntity.bestPoBestIdFk = pintBestID Then
                bestPo = New Bestellposition(bestPoEntity)
                bestPoListe.Add(bestPo)
            ElseIf pintBestID = 0 Then
                MsgBox("Warenkorb ist leer")
                Exit For
            End If
        Next
        Return bestPoListe
    End Function

    'in den Warenkorb
    Public Function hinzufInWarenkorb(pWare As Ware, paktKunde As Kunde, pintAnzahl As Integer) As Bestellposition Implements IBestellpositionverwaltung.hinzufInWarenkorb
        Dim bestPoEntity As New BestellpositionEntity
        Dim bestPo As New Bestellposition
        Dim bestBestellung As Bestellung = New Bestellung
        Dim bestEntity As BestellungEntity
        'überprüfen, ob die Bestellung schon vorhanden ist
        For Each bestEntity In db.tblBestellungen.ToList
            If bestEntity.bestKunIdFk = paktKunde.BenutzerID Then 'überprüfen: eine Bestellung in der DB zum angemeldeten Kunden gehört
                If bestEntity.bestStatus = "Unbezahlt" Then 'überprüfen: diese Bestellung, die zum aktuellen Kunde gehört, bestStatus von "Unbezahlt" hat.
                    bestBestellung = New Bestellung(bestEntity) 'Objekt von Bestellung mit den Parametern von der Entity(Dateien von der Datenbank) zugewiesen werden.
                    Exit For
                Else
                    bestBestellung = New Bestellung 'Objekt von Bestellung ohne Parameter konstruiert
                    bestBestellung.BestellungID = erstellenBestellung(bestBestellung, paktKunde.BenutzerID) 'eine neue Bestellung erstellt. Wir brauchen aber Integer als Rückgabewert (BestellungID)
                    Exit For
                End If
            End If
        Next

        If bestBestellung.BestellungID = -1 Then
            bestBestellung.BestellungID = erstellenBestellung(bestBestellung, paktKunde.BenutzerID) 'Bestellung ID von der neu erstellten Bestellung zugewiesen
        End If

        'eine neue Bestellposition erstellen
        bestPoEntity.bestPoIdPk = bestPo.BestellpositionID
        bestPoEntity.bestPoAnzahl = pintAnzahl
        bestPoEntity.bestPoBestIdFk = bestBestellung.BestellungID
        bestPoEntity.bestPoWIdFk = pWare.ID

        db.tblBestellpositionen.Attach(bestPoEntity)
        db.Entry(bestPoEntity).State = EntityState.Added
        db.SaveChanges()
        bestPo = New Bestellposition(bestPoEntity)
        Return bestPo

    End Function

    Public Function erstellenBestellung(pBestellung As Bestellung, pintKundeID As Integer) As Integer Implements IBestellpositionverwaltung.erstellenBestellung
        Dim bestEntity As BestellungEntity
        If pBestellung Is Nothing Then
            Return -1
        End If
        bestEntity = pBestellung.gibAlsBestEntity
        bestEntity.bestKunIdFk = pintKundeID
        db.tblBestellungen.Attach(bestEntity)
        db.Entry(bestEntity).State = EntityState.Added 'neue Datensätze in die Datenbank über Entity hinzugefügt werden
        db.SaveChanges()
        Return bestEntity.bestIdPk
    End Function

    'removeFromCart
    Public Sub loeschenBestellposition(pintBestPoId As Integer) Implements IBestellpositionverwaltung.loeschenBestellposition
        Dim bestPoEntity As BestellpositionEntity
        bestPoEntity = db.tblBestellpositionen.Find(pintBestPoId)
        If bestPoEntity Is Nothing Then
            Exit Sub
        End If
        db.tblBestellpositionen.Attach(bestPoEntity)
        db.Entry(bestPoEntity).State = EntityState.Deleted
        db.SaveChanges()
    End Sub

    'zeig alle Lieferanten
    Public Function gibLieferanten() As List(Of Lieferant) Implements IBestellpositionverwaltung.gibLieferanten
        Dim liefListe As New List(Of Lieferant)
        Dim lLief As Lieferant
        Dim liefEntity As LieferantEntity

        For Each liefEntity In db.tblLieferanten.ToList
            lLief = New Lieferant(liefEntity)
            liefListe.Add(lLief)
        Next
        Return liefListe
    End Function

    'klicken 'Bezahlen' -> create object: Lieferung
    Public Function erstellenLieferung(pintBestId As Integer, pintLiefId As Integer) As Lieferung Implements IBestellpositionverwaltung.erstellenLieferung
        Dim lieferEntity As New LieferungEntity
        Dim liefLieferung As New Lieferung
        'Dim bestBestellung As New Bestellung
        'Dim bestEntity As New BestellungEntity

        lieferEntity.lieferIdPk = liefLieferung.LieferungID
        lieferEntity.datAnfang = liefLieferung.AnfangDatum
        lieferEntity.datEnde = liefLieferung.EndeDatum
        lieferEntity.bestIdFk = pintBestId
        lieferEntity.liefIdFk = pintLiefId

        db.tblLieferungen.Attach(lieferEntity)
        db.Entry(lieferEntity).State = EntityState.Added
        db.SaveChanges()
        liefLieferung = New Lieferung(lieferEntity)
        Return liefLieferung
        aendernStatus(lieferEntity.bestIdFk)
    End Function

    Public Sub aendernStatus(pintBestellungId As Integer)
        Dim bestBestellung As New Bestellung
        Dim bestEntity As New BestellungEntity
        For Each best In db.tblBestellungen.ToList
            If bestEntity.bestIdPk = pintBestellungId Then
                bestEntity = best
            End If
        Next
        bestEntity.bestStatus = "Bezahlt"

        db.tblBestellungen.Attach(bestEntity)
        db.Entry(bestBestellung).State = EntityState.Modified
        db.SaveChanges()
    End Sub

End Class
