Public Class AnmeldungDummy
    Private Sub btnAnmelden_Click(sender As Object, e As EventArgs) Handles btnAnmelden.Click
        anmelden()
    End Sub

    Private Sub anmelden()
        Dim strBenutzername As String
        Dim strPasswort As String
        Dim svc As BenutzerverwaltungServiceReference.IBenutzerverwaltung
        svc = New BenutzerverwaltungServiceReference.BenutzerverwaltungClient


        strBenutzername = Trim(Me.txtBenutzername.Text)
        strPasswort = Me.txtPasswort.Text
        svc.Einloggen(strBenutzername, strPasswort)


    End Sub

    Private Sub txtBenutzername_TextChanged(sender As Object, e As EventArgs) Handles txtBenutzername.TextChanged

    End Sub

    Private Sub AnmeldungDummy_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub
End Class