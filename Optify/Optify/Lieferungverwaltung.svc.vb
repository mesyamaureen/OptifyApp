' HINWEIS: Mit dem Befehl "Umbenennen" im Kontextmenü können Sie den Klassennamen "Lieferungverwaltung" sowohl im Code als auch in der SVC-Datei und der Konfigurationsdatei ändern.
' HINWEIS: Wählen Sie zum Starten des WCF-Testclients zum Testen dieses Diensts Lieferungverwaltung.svc oder Lieferungverwaltung.svc.vb im Projektmappen-Explorer aus, und starten Sie das Debuggen.
Public Class Lieferungverwaltung
    Implements ILieferungverwaltung
    Private db As LieferungEntity
    Public Sub DoWork() Implements ILieferungverwaltung.DoWork
    End Sub

End Class
