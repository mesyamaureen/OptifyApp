' HINWEIS: Mit dem Befehl "Umbenennen" im Kontextmenü können Sie den Klassennamen "gibKunde" sowohl im Code als auch in der SVC-Datei und der Konfigurationsdatei ändern.
' HINWEIS: Wählen Sie zum Starten des WCF-Testclients zum Testen dieses Diensts gibKunde.svc oder gibKunde.svc.vb im Projektmappen-Explorer aus, und starten Sie das Debuggen.
Public Class gibKunde
    Implements IgibKunde

    'liefern gibKunde wenn benBenutzer = Kunde - bentyp = "Kunde"
    'Public Function gibKunde(pstrBenutzername As String, pstrPasswort As String) As Kunde Implements IgibKunde.gibKunde 'what kind of parameter needed?
    '    'Deklaration
    '    'Dim benEntity As BenutzerEntity
    '    'Dim benBenutzer As Benutzer
    '    'Dim Benutzerverwaltung As Benutzerverwaltung
    '    'überprüfen, ob bentyp = "Kunde"
    '    'Try

    '    'Catch ex As Exception

    '    'End Try
    '    'liefern Kunde zurück
    'End Function
End Class
