Public Class StartseiteKundenDummy
    Private Sub btnLaden_Click(sender As Object, e As EventArgs) Handles btnLaden.Click
        laden()
    End Sub

    Private Sub laden()
        Dim warenListe As List(Of WarenverwaltungServiceReference.Ware)
        Dim svc As WarenverwaltungServiceReference.IWarenverwaltungService
        svc = New WarenverwaltungServiceReference.WarenverwaltungServiceClient
        warenListe = svc.alleWarenLaden
        Me.DataGridView1.DataSource = warenListe
    End Sub

    Private Sub frmAlleWaren_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub
End Class
