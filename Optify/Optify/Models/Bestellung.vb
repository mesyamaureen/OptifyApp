Public Class Bestellung
    'Attribute
    Dim mbestID As Integer
    Dim mdatBestellung As Date 'erstelltes Datum
    'Dim mkundID As Kunde
    Dim mintWaren As Integer
    Dim mbestPreis As Decimal
    Dim mbestStatus As String

    'Konstruktor
    Public Sub New()
        mbestID = -1
        mdatBestellung = Date.Now
        'kundenID?
        mintWaren = Nothing
        mbestPreis = Nothing
        mbestStatus = String.Empty
    End Sub

    'Konstruktor für Entity
    Public Sub New(pBestellungEntity As BestellungenEntity)
        mbestID = pBestellungEntity.bestIdPk
        mdatBestellung = pBestellungEntity.bestDatum
        'mintWaren = pBestellungEntity.bestWaren
        mbestPreis = pBestellungEntity.bestPreis
        mbestStatus = pBestellungEntity.bestStatus

        'If IsNothing(pBestellungEntity.bestVersion) Then
        '    mbytVersion = Nothing
        'Else
        '    mbytVersion = pBestellungEntity.bestVersion
        'End If

        'mbrBranche = New Branche(pJobanzeigeEntity.JaBrIdFk, "")
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

    Public Property Waren As Integer
        Get
            Return mintWaren
        End Get
        Set(value As Integer)
            mintWaren = value
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

    'Funktion
    Public Function gibAlsBestEntity() As BestellungenEntity
        Dim bestEntity As BestellungenEntity
        bestEntity = New BestellungenEntity
        bestEntity.bestIdPk = BestellungID
        bestEntity.bestDatum = DatumBestellung
        bestEntity.bestPreis = Preis
        bestEntity.bestStatus = Status
        'bestEntity.bestWaren = Waren
        Return bestEntity
    End Function
End Class
