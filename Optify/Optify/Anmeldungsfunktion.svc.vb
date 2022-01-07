Imports System.Data.Entity
Public Class Anmeldungsfunktion
    Implements IAnmeldungsfunktion

    Private db As OptifyEntities1 = New OptifyEntities1

    Public Function Einloggen(pstrBenutzername As String, pstrPasswort As String) As Benutzer Implements IAnmeldungsfunktion.Einloggen
        Dim angemeldBen As New Benutzer
        Dim strBenutzername As String = pstrBenutzername
        Dim strPasswort As String = pstrPasswort
        Dim kkun As New Kunde
        Dim llief As New Lieferant
        Dim mmit As New Mitarbeiter
        Dim kEntity As New KundeEntity
        Dim lEntity As New LieferantEntity
        Dim mEntity As New MitarbeiterEntity

        Try
            For Each kun In db.tblKunde.ToList
                If (kun.strBenutzername.Equals(pstrBenutzername) And kun.strPasswort.Equals(pstrPasswort)) Then
                    kEntity = kun 'gelesene Datei in der Kunden Entity gespeichert
                    kkun = New Kunde(kEntity) 'Aufruf: Konstruktor mit Entity als Parameter
                    kkun.BenutzerID = kEntity.kunIdPk 'Alle Attribute von der Entity Objekt in den Objekt: Kunde
                    kkun.Benutzername = kEntity.strBenutzername
                    kkun.Adresse = kEntity.strAdresse
                    kkun.Firmenname = kEntity.strFirmenname
                    kkun.Name = kEntity.strName
                    kkun.Passwort = kEntity.strPasswort
                    kkun.SteuerID = kEntity.strSteuerID
                    kkun.Vorname = kEntity.strVorname
                    Exit For 'eingegebene Parametern = Datensatz in der Datenbank -> raus von For Each Schleife
                End If
            Next
        Catch ex As Exception
            kEntity = Nothing
        End Try

        If kEntity.strBenutzername IsNot Nothing Then 'brauchen nur 
            angemeldBen.BenutzerID = kkun.BenutzerID
            angemeldBen.Benutzername = kkun.Benutzername
            angemeldBen.Name = kkun.Name
            angemeldBen.Passwort = kkun.Passwort
            angemeldBen.Vorname = kkun.Vorname
            angemeldBen.Typ = "Kunde" 'zusätzliches Atrribut zur Startseite
            Return angemeldBen
        End If

        Try
            For Each lief In db.tblLieferanten.ToList
                If (lief.strBenutzername.Equals(pstrBenutzername) And lief.strPasswort.Equals(pstrPasswort)) Then
                    lEntity = lief
                    llief.BenutzerID = lEntity.liefIdPk
                    llief.Benutzername = lEntity.strBenutzername
                    llief.Adresse = lEntity.strAdresse
                    llief.Firmenname = lEntity.strFirmenname
                    llief.Name = lEntity.strName
                    llief.Passwort = lEntity.strPasswort
                    llief.SteuerID = lEntity.strSteuerID
                    llief.Vorname = lEntity.strVorname
                    Exit For
                End If
            Next
        Catch ex As Exception
            lEntity = Nothing
        End Try

        If lEntity.strBenutzername IsNot Nothing Then
            angemeldBen.BenutzerID = llief.BenutzerID
            angemeldBen.Benutzername = llief.Benutzername
            angemeldBen.Name = llief.Name
            angemeldBen.Passwort = llief.Passwort
            angemeldBen.Vorname = llief.Vorname
            angemeldBen.Typ = "Lieferant"

            Return angemeldBen
        End If

        Try
            For Each mit In db.tblMitarbeiter.ToList
                If (mit.strBenutzername.Equals(pstrBenutzername) And mit.strPasswort.Equals(pstrPasswort)) Then
                    mEntity = mit
                    mmit.BenutzerID = mEntity.mitIdPk
                    mmit.Benutzername = mEntity.strBenutzername
                    mmit.Name = mEntity.strName
                    mmit.Passwort = mEntity.strPasswort
                    mmit.Vorname = mEntity.strVorname
                    Exit For
                End If
            Next
        Catch ex As Exception
            mEntity = Nothing
        End Try

        If mEntity.strBenutzername IsNot Nothing Then
            angemeldBen.BenutzerID = mmit.BenutzerID
            angemeldBen.Benutzername = mmit.Benutzername
            angemeldBen.Name = mmit.Name
            angemeldBen.Passwort = mmit.Passwort
            angemeldBen.Vorname = mmit.Vorname
            angemeldBen.Typ = "Mitarbeiter"
            Return angemeldBen
        End If


        Return angemeldBen
    End Function



    Public Function gibKunde(pangemeldBen As Benutzer) As Kunde Implements IAnmeldungsfunktion.gibKunde
        Dim kun As New KundeEntity

        For Each kkun In db.tblKunde.ToList
            If kkun.strBenutzername.Equals(pangemeldBen.Benutzername) Then
                kun = kkun

            End If

        Next

        Dim aktKun As New Kunde With {
            .BenutzerID = pangemeldBen.BenutzerID,
            .Benutzername = pangemeldBen.Benutzername,
            .Name = pangemeldBen.Name,
            .Vorname = pangemeldBen.Vorname,
            .Passwort = pangemeldBen.Passwort,
            .Adresse = kun.strAdresse,
            .Firmenname = kun.strFirmenname,
            .SteuerID = kun.strSteuerID}

        Return aktKun
    End Function

    Public Function gibLieferant(pBen As Benutzer) As Lieferant Implements IAnmeldungsfunktion.gibLieferant
        Dim lief As New LieferantEntity
        Dim aktLief As New Lieferant With {
            .BenutzerID = pBen.BenutzerID,
            .Benutzername = pBen.Benutzername,
            .Name = pBen.Name,
            .Vorname = pBen.Vorname,
            .Passwort = pBen.Passwort,
            .Adresse = lief.strAdresse,
            .Firmenname = lief.strFirmenname,
            .SteuerID = lief.strSteuerID}

        Return aktLief
    End Function

    Public Function gibMitarbeiter(pBen As Benutzer) As Mitarbeiter Implements IAnmeldungsfunktion.gibMitarbeiter
        Dim aktMit As New Mitarbeiter With {
            .BenutzerID = pBen.BenutzerID,
            .Benutzername = pBen.Benutzername,
            .Name = pBen.Name,
            .Vorname = pBen.Vorname,
            .Passwort = pBen.Passwort}

        Return aktMit
    End Function

End Class
