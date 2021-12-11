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
    Public Sub Starten(pstrBenutzername As String, pstrPasswort As String) Implements IBenutzerverwaltung.Starten
        Dim strBenutzername As String = pstrBenutzername 'initialisieren how?
        Dim strPasswort As String = pstrPasswort
        Dim angemeldeterBenutzer As Benutzer

        'call function einloggen
        angemeldeterBenutzer = Einloggen(strBenutzername, strPasswort)
        If angemeldeterBenutzer.Typ = "Kunde" Then
            gibKunde(angemeldeterBenutzer)
        ElseIf angemeldeterBenutzer.Typ = "Lieferant" Then
            gibLieferant(angemeldeterBenutzer)
        Else gibMitarbeiter(angemeldeterBenutzer)
        End If

        'rückgabewert Benutzer - zuweisen gibKunde,Lieferant,Mitarbeiter
    End Sub

    Public Function Einloggen(pstrBenutzername As String, pstrPasswort As String) As Benutzer Implements IBenutzerverwaltung.Einloggen
        Dim benEntity As BenutzerEntity
        Dim benBenutzer As Benutzer = New Benutzer
        Try
            For Each ben In db.tblBenutzer.ToList
                If (ben.strBenutzername.Equals(pstrBenutzername) And ben.strPasswort.Equals(pstrPasswort)) Then
                    benEntity = ben
                    benBenutzer.BenutzerID = ben.benIdPk
                    benBenutzer.Benutzername = ben.strBenutzername
                    benBenutzer.Name = ben.strName
                    benBenutzer.Vorname = ben.strVorname
                    benBenutzer.Passwort = ben.strPasswort
                    benBenutzer.Typ = ben.benTyp
                End If
            Next
        Catch ex As Exception
            benEntity = Nothing
        End Try
        Return benBenutzer
    End Function

    'create in the project 3 new services to show which logic to call depending on who's logged in

    'liefern gibKunde wenn benBenutzer = Kunde - bentyp = "Kunde"
    Public Function gibKunde(pBenutzer As Benutzer) As Kunde Implements IBenutzerverwaltung.gibKunde 'what kind of parameter needed?
        'Deklaration
        'Dim benEntity As BenutzerEntity = New BenutzerEntity
        'Dim benBenutzer As Benutzer = New Benutzer
        Dim kun As Kunde = New Kunde With {
            .BenutzerID = pBenutzer.BenutzerID,
            .Benutzername = pBenutzer.Benutzername,
            .Passwort = pBenutzer.Passwort,
            .Name = pBenutzer.Name,
            .Vorname = pBenutzer.Vorname,
            .Typ = pBenutzer.Typ,
            .Adresse = pBenutzer.Kunde.Adresse,
            .SteuerID = pBenutzer.Kunde.SteuerID,
            .Firmenname = pBenutzer.Kunde.Firmenname
            }

        '.Adresse = benEntity.strAdresse,
        '.SteuerID = benEntity.strSteuerID,
        '.Firmenname = pBenutzer.f,

        Return kun

    End Function

    'liefern gibLieferant wenn benBenutzer = Lieferant - bentyp = "Lieferant", parameter?
    Public Function gibLieferant(pBenutzer As Benutzer) As Lieferanten Implements IBenutzerverwaltung.gibLieferant
        'Deklaration
        Dim benEntity As BenutzerEntity
        Dim benBenutzer As Benutzer
        Dim lief As Lieferanten
        'Entity für den angemeldeten Benutzer konstruiieren
        lief.BenutzerID = benEntity.benIdPk
        lief.Firmenname = benEntity.strFirmenname
        lief.Benutzername = benEntity.strBenutzername
        lief.Passwort = benEntity.strPasswort
        lief.Name = benEntity.strName
        lief.Vorname = benEntity.strVorname
        lief.Adresse = benEntity.strAdresse
        lief.SteuerID = benEntity.strSteuerID
        lief.Typ = benEntity.benTyp
        Return lief
    End Function


    'liefern gibMitarbeiter wenn benBenutzer = Mitarbeiter - bentyp = "Mitarbeiter", parameter?
    Public Function gibMitarbeiter(pBenutzer As Benutzer) As Mitarbeiter Implements IBenutzerverwaltung.gibMitarbeiter
        'Deklaration
        Dim benEntity As BenutzerEntity
        Dim benBenutzer As Benutzer
        Dim mit As Mitarbeiter
        'Entity für den angemeldeten Benutzer konstruiieren
        mit.BenutzerID = benEntity.benIdPk
        mit.Benutzername = benEntity.strBenutzername
        mit.Passwort = benEntity.strPasswort
        mit.Name = benEntity.strName
        mit.Vorname = benEntity.strVorname
        mit.Typ = benEntity.benTyp
        Return mit
    End Function

End Class
