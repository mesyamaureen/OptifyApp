' HINWEIS: Mit dem Befehl "Umbenennen" im Kontextmenü können Sie den Klassennamen "Lieferungverwaltung" sowohl im Code als auch in der SVC-Datei und der Konfigurationsdatei ändern.
' HINWEIS: Wählen Sie zum Starten des WCF-Testclients zum Testen dieses Diensts Lieferungverwaltung.svc oder Lieferungverwaltung.svc.vb im Projektmappen-Explorer aus, und starten Sie das Debuggen.
Imports System.Data.Entity
Public Class Lieferungverwaltung
    Implements ILieferungverwaltung
    Private db As OptifyEntities1 = New OptifyEntities1

    Public Function gibLieferungen() As List(Of Lieferung) Implements ILieferungverwaltung.gibLieferungen
        Dim liefListe As List(Of Lieferung)
        Dim lief As Lieferung
        liefListe = New List(Of Lieferung)
        For Each liefEntity In db.tblLieferungen.ToList
            lief = New Lieferung(liefEntity)
            liefListe.Add(lief)
        Next
        Return liefListe
    End Function

    Public Function LieferungOeffnen(pintLiefID As Integer) Implements ILieferungverwaltung.LieferungOeffnen
        Dim lief As Lieferung
        Dim liefEntity As LieferungEntity
        liefEntity = db.tblLieferungen.Find(pintLiefID)
        lief = New Lieferung(liefEntity)
        Return lief
    End Function

    Public Sub hinzufuegenLieferung(pLieferung As Lieferung) Implements ILieferungverwaltung.hinzufuegenLieferung

    End Sub

    Public Sub loeschenLieferung(pliefId As Integer) Implements ILieferungverwaltung.loeschenLieferung
        Dim liefEntity As LieferungEntity
        liefEntity = db.tblLieferungen.Find(pliefId)
        If liefEntity Is Nothing Then
            Exit Sub
        End If
        db.tblLieferungen.Attach(liefEntity)
        db.Entry(liefEntity).State = EntityState.Deleted
        db.SaveChanges()
    End Sub
End Class
