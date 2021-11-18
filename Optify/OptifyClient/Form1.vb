Public Class frmAlleWaren
    Private Sub btnLaden_Click(sender As Object, e As EventArgs) Handles btnLaden.Click
        laden()
    End Sub

    Private Sub laden()
        Dim warenListe As List(Of WarenServiceReference.Ware)
        Dim svc As WarenServiceReference.IWarenverwaltungService
        svc = New WarenServiceReference.WarenverwaltungServiceClient
        warenListe = svc.alleWarenLaden
        Me.DataGridView1.DataSource = warenListe
    End Sub

    Private Sub frmAlleWaren_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub
End Class
