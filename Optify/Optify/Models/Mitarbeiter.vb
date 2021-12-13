Public Class Mitarbeiter
    Inherits Benutzer

    Sub New()
        MyBase.New()
    End Sub

    Sub New(pintBenutzerID As Integer, pstrName As String, pstrVorname As String, pstrBenutzername As String, pstrPasswort As String)
        MyBase.New(pintBenutzerID, pstrName, pstrVorname, pstrBenutzername, pstrPasswort)
    End Sub

    Sub New(pmitEntity As MitarbeiterEntity)
        BenutzerID = pmitEntity.mitIdPk
        Name = pmitEntity.strName
        Vorname = pmitEntity.strVorname
        Benutzername = pmitEntity.strBenutzername
        Passwort = pmitEntity.strPasswort
    End Sub

    Public Function gibAlsMitarbeiterEntity() As MitarbeiterEntity
        Dim mitE As MitarbeiterEntity = New MitarbeiterEntity
        mitE.mitIdPk = BenutzerID
        mitE.strName = Name
        mitE.strVorname = Vorname
        mitE.strBenutzername = Benutzername
        mitE.strPasswort = Passwort

        Return mitE
    End Function
End Class
