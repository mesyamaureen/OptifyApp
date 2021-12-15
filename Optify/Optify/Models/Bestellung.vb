Public Class Bestellung
    'Attribute
    Dim mbestID As Integer
    Dim mdatBestellung As Date 'erstelltes Datum
    Dim mkundID As Integer
    Dim mbestPreis As Double
    Dim mbestStatus As String

    'Konstruktor
    Public Sub New()
        mbestID = -1
        mdatBestellung = Date.Now
        mkundID = Nothing
        mbestPreis = Nothing
        mbestStatus = String.Empty
    End Sub

    Public Sub New(pbestID As Integer, pdatBestellung As Date, pkundId As Integer, pbestPreis As Double, pbestStatus As String)
        mbestID = pbestID
        mdatBestellung = pdatBestellung
        mkundID = pkundId
        mbestPreis = pbestPreis
        mbestStatus = pbestStatus
    End Sub

    'Konstruktor für Entity
    Public Sub New(pBestellungEntity As BestellungEntity)
        mbestID = pBestellungEntity.bestIdPk
        mdatBestellung = pBestellungEntity.bestDatum
        mkundID = pBestellungEntity.bestKunIdFk
        mbestPreis = pBestellungEntity.bestPreis
        mbestStatus = pBestellungEntity.bestStatus
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

    Public Property KundenID As Integer
        Get
            Return mkundID
        End Get
        Set(value As Integer)
            mkundID = value
        End Set
    End Property

    Public Property Preis As Double
        Get
            Return mbestPreis
        End Get
        Set(value As Double)
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

    Public Function gibAlsBestEntity() As BestellungEntity
        Dim bestEntity As New BestellungEntity
        bestEntity.bestIdPk = BestellungID
        bestEntity.bestDatum = Date.Now
        bestEntity.bestKunIdFk = KundenID
        bestEntity.bestPreis = 0
        bestEntity.bestStatus = "Unbezahlt"
        Return bestEntity
    End Function
End Class
