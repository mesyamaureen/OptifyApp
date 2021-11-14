Public Class frmAlleBestellungen
    Private Sub btnLaden_Click(sender As Object, e As EventArgs) Handles btnLaden.Click
        laden()
    End Sub

    Private Sub laden()
        Dim bestListe As List(Of BestellungServiceReference.Bestellung)
        Dim svc As BestellungServiceReference.IBestellungverwaltung
        svc = New BestellungServiceReference.BestellungverwaltungClient
        bestListe = svc.gibBestellungen
        Me.DataGridView1.DataSource = bestListe
    End Sub
End Class
