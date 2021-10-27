Public Class Bestellung
    'Attribute
    Dim mbestID As Integer
    Dim mdatBestellung As Date 'erstelltes Datum
    'Dim mkundID As Kunde
    Dim mWaren As List(Of Ware)
    Dim mbestPreis As Decimal
    Dim mbestStatus As String

    'Konstruktor
    Public Sub New()
        mbestID = -1
        mdatBestellung = Date.Now
        'kundenID?
        mWaren = Nothing
        mbestPreis = Nothing
        mbestStatus = String.Empty
    End Sub

    'Properties
    Public Property BestellungID As Integer
        Get
            Return mbestID
        End Get
        Set(value As Integer)
            mbestID = value
        End Set
    End Property

    Public Property DatumBestellung As Date
        Get
            Return mdatBestellung
        End Get
        Set(value As Date)
            mdatBestellung = value
        End Set
    End Property

    'Public Property KundenID As Kunde
    '    Get
    '        Return mkundID
    '    End Get
    '    Set(value As Kunde)
    '        mkundID = value
    '    End Set
    'End Property

    Public Property WarenListe As List(Of Ware)
        Get
            Return mWaren
        End Get
        Set(value As List(Of Ware))
            mWaren = value
        End Set
    End Property

    Public Property Preis As Decimal
        Get
            Return mbestPreis
        End Get
        Set(value As Decimal)
            mbestPreis = value
        End Set
    End Property

    Public Property Status As String
        Get
            Return mbestStatus
        End Get
        Set(value As String)
            mbestStatus = value
        End Set
    End Property

End Class
