Public Class Lieferung
    'Attribut
    Dim mlieferID As Integer
    Dim mdatAnfang As Date
    Dim mdatEnde As Date
    Dim mBestellung As Bestellung

    'Konstruktor
    Public Sub New()
        mlieferID = -1
        mdatAnfang = Date.MinValue
        mdatEnde = Date.MaxValue
        mBestellung = Nothing
    End Sub

    'Properties
    Public Property ID As Integer
        Get
            Return mlieferID
        End Get
        Set(value As Integer)
            mlieferID = value
        End Set
    End Property

    Public Property AnfangDatum As Date
        Get
            Return mdatAnfang
        End Get
        Set(value As Date)
            mdatAnfang = value
        End Set
    End Property

    Public Property EndeDatum As Date
        Get
            Return mdatEnde
        End Get
        Set(value As Date)
            mdatEnde = value
        End Set
    End Property

    Public Property Bestellung As Bestellung
        Get
            Return mBestellung
        End Get
        Set(value As Bestellung)
            mBestellung = value
        End Set
    End Property
End Class
