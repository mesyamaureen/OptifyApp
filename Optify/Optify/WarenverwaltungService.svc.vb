Imports System.Data.Entity


Public Class WarenverwaltungService
    Implements IWarenverwaltungService

    Private db As OptifyDBEntities = New OptifyDBEntities

    Function alleWarenLaden() As List(Of Ware) Implements IWarenverwaltungService.alleWarenLaden
        Dim wListe As List(Of Ware)
        Dim w As Ware
        Dim wEntity As WareEntity

        wListe = New List(Of Ware)
        For Each wEntity In db.tblWaren.ToList
            w = New Ware(wEntity)
            wListe.Add(w)
        Next


        Return wListe

    End Function

    Function wareOeffnen(pIntId As Integer) As Ware Implements IWarenverwaltungService.wareOeffnen

        Dim w As Ware
        Dim wEntity As WareEntity

        wEntity = db.tblWaren.Find(pIntId)
        w = New Ware(wEntity)


        Return w
    End Function

    Sub wareLoeschen(pintId As Integer) Implements IWarenverwaltungService.wareLoeschen
        Dim wEntity As WareEntity ' Urlaubsantrag, der in der Datenbank existiert

        '' Suchen nach einem Urlaubsantrag in der Datenbank mit der übergebenen ID
        wEntity = db.tblWaren.Find(pintId)

        '' Prüfen, ob in der Datenbank ein Urlaubsantrag mit der ID exisitiert
        If wEntity Is Nothing Then
            '    ' Wenn nicht, dann gibt es auch nichts, was gelöscht werden muss
            Exit Sub
        End If

        '' Urlaubsantragsentity mit der Datenbank bekannt machen und löschen
        db.tblWaren.Attach(wEntity)
        db.Entry(wEntity).State = EntityState.Deleted ' soll entfernt werden
        db.SaveChanges()


    End Sub


    Sub wareSpeichern(pWare As Ware) Implements IWarenverwaltungService.wareSpeichern
        Dim wEntity As WareEntity ' Urlaubsantrag, der in der Datenbank gespeichert wird

        '' Prüfen, ob ein Urlaubsantrag übergeben wurde
        If pWare Is Nothing Then
            '    ' Wenn nichts übergeben wurde, gibt es nichts zu tun; dann die Prozedur verlassen
            Exit Sub
        End If

        '' Übergebenen Urlaubsantrag in ein Entity umwandeln
        wEntity = pWare.gibAlsEntity
        ' Urlaubsantragsentity mit der Datenbank bekannt machen und speichern
        db.tblWaren.Attach(wEntity)
        db.Entry(wEntity).State = EntityState.Modified ' vorgenommene Änderungen sollen gespeichert werden
        db.SaveChanges()
    End Sub

    Public Function wareHinzufuegen(pWare As Ware) As Integer Implements IWarenverwaltungService.wareHinzufuegen

        Dim wEntity As WareEntity

        '' Prüfen, ob ein Urlaubsantrag übergeben wurde
        If pWare Is Nothing Then
            '    ' Wenn nichts übergeben wurde, gibt es nichts zu tun; dann die Prozedur verlassen
            Return -1
        End If

        '' Übergebenen Urlaubsantrag in ein Entity umwandeln
        wEntity = pWare.gibAlsEntity

        '' Urlaubsantragsentity mit der Datenbank bekannt machen und speichern
        db.tblWaren.Attach(wEntity)
        db.Entry(wEntity).State = EntityState.Added 'soll neu hinzugefügt werden
        db.SaveChanges()
        Return wEntity.wIdPk

    End Function


End Class
