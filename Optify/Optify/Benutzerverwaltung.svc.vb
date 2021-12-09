' HINWEIS: Mit dem Befehl "Umbenennen" im Kontextmenü können Sie den Klassennamen "Benutzerverwaltung" sowohl im Code als auch in der SVC-Datei und der Konfigurationsdatei ändern.
' HINWEIS: Wählen Sie zum Starten des WCF-Testclients zum Testen dieses Diensts Benutzerverwaltung.svc oder Benutzerverwaltung.svc.vb im Projektmappen-Explorer aus, und starten Sie das Debuggen.
Imports System.Data.Entity
Public Class Benutzerverwaltung
    Implements IBenutzerverwaltung
    Private db As OptifyDBEntities = New OptifyDBEntities

    'Public Function Einloggen(pstrBenutzername As String, pstrPasswort As String) As Benutzer Implements IBenutzerverwaltung.Einloggen
    '    Dim kun As Kunde = New Kunde
    '    Dim lief As Lieferanten = New Lieferanten
    '    Dim mit As Mitarbeiter = New Mitarbeiter
    '    Dim benut As Benutzer = New Benutzer
    '    Dim benEntity As BenutzerEntity
    '    Try
    '        For Each ben In db.tblBenutzer.ToList
    '            If (ben.strBenutzername.Equals(pstrBenutzername) And ben.strPasswort.Equals(pstrPasswort)) Then
    '                benEntity = ben
    '                If benEntity.benTyp = "Kunde" Then
    '                    kun.BenutzerID = ben.benIdPk
    '                    kun.Firmenname = ben.strFirmenname
    '                    kun.Benutzername = ben.strBenutzername
    '                    kun.Passwort = ben.strPasswort
    '                    kun.Name = ben.strName
    '                    kun.Vorname = ben.strVorname
    '                    kun.Adresse = ben.strAdresse
    '                    kun.SteuerID = ben.strSteuerID
    '                    Return kun
    '                ElseIf benEntity.benTyp = "Lieferant" Then
    '                    lief.BenutzerID = ben.benIdPk
    '                    lief.Firmenname = ben.strFirmenname
    '                    lief.Benutzername = ben.strBenutzername
    '                    lief.Passwort = ben.strPasswort
    '                    lief.Name = ben.strName
    '                    lief.Vorname = ben.strVorname
    '                    lief.Adresse = ben.strAdresse
    '                    lief.SteuerID = ben.strSteuerID
    '                    Return lief
    '                Else
    '                    mit.BenutzerID = ben.benIdPk
    '                    mit.Benutzername = ben.strBenutzername
    '                    mit.Passwort = ben.strPasswort
    '                    mit.Name = ben.strName
    '                    mit.Vorname = ben.strVorname
    '                    Return benut 'Return mit

    '                End If
    '            End If
    '        Next
    '    Catch ex As Exception
    '        benEntity = Nothing
    '        'Return Nothing
    '    End Try
    'End Function

    Public Function Einloggen(pstrBenutzername As String, pstrPasswort As String) As Benutzer Implements IBenutzerverwaltung.Einloggen
        Dim benEntity As BenutzerEntity
        Dim benBenutzer As Benutzer
        Try
            For Each ben In db.tblBenutzer.ToList
                If (ben.strBenutzername.Equals(pstrBenutzername) And ben.strPasswort.Equals(pstrPasswort)) Then
                    benEntity = ben
                    benBenutzer.BenutzerID = ben.benIdPk
                    Return benBenutzer
                End If
            Next
        Catch ex As Exception
            benEntity = Nothing
            'Return Nothing
        End Try
    End Function

    'create in the project 3 new services to show which logic to call depending on who's logged in
End Class
