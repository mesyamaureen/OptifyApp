Public Class AnmeldungDummy
    Private Sub btnAnmelden_Click(sender As Object, e As EventArgs) Handles btnAnmelden.Click
        Dim benBenutzer As New AnmeldungsfunktionServiceReference.Benutzer
        Dim sKundeDummy As New StartseiteKundenDummy
        Dim sMitDummy As New StartseiteMitarbeiterDummy
        Dim sLiefDummy As New LiefDummy
        benBenutzer = anmelden()
        'If benBenutzer.Then Then

        'End If
    End Sub

    Private Function anmelden() As AnmeldungsfunktionServiceReference.Benutzer
        Dim strBenutzername As String
        Dim strPasswort As String
        Dim benBenutzer As AnmeldungsfunktionServiceReference.Benutzer = New AnmeldungsfunktionServiceReference.Benutzer
        Dim svc As AnmeldungsfunktionServiceReference.IAnmeldungsfunktion
        svc = New AnmeldungsfunktionServiceReference.AnmeldungsfunktionClient


        strBenutzername = Trim(Me.txtBenutzername.Text)
        strPasswort = Me.txtPasswort.Text
        benBenutzer = svc.Einloggen(strBenutzername, strPasswort)

    End Function

    Private Sub benkun()
        Dim benKun As AnmeldungsfunktionServiceReference.Kunde = New AnmeldungsfunktionServiceReference.Kunde

    End Sub

End Class