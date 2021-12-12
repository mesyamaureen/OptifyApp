Public Class Bestellposition
    Private mbestPoID As Long
    Private mbestBestellungID As String
    Private mwareID As String

    Sub New()

    End Sub

    Sub New(pbestPoID As Long, pbestBestellungID As String, pwareID As String)
        mbestPoID = pbestPoID
        mbestBestellungID = pbestBestellungID
        mwareID = pwareID
    End Sub

    'Konstruktor Entity

End Class
