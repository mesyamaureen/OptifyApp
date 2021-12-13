Public Class Lieferung
    'Attribut
    Private mlieferID As Integer
    Private mdatAnfang As Date
    Private mdatEnde As Date
    Private mbestID As Integer
    Private mliefID As Integer

    'Konstruktor
    Public Sub New()
        mlieferID = -1
        mdatAnfang = Date.MinValue
        mdatEnde = Date.MaxValue
        mbestID = Nothing
        mliefID = Nothing
    End Sub

    Public Sub New(plieferID As Integer, pdatAnfang As Date, pdatEnde As Date, pbestID As Integer, pliefID As Integer)
        mlieferID = plieferID
        mdatAnfang = pdatAnfang
        mdatEnde = pdatEnde
        mbestID = pbestID
        mliefID = pliefID
    End Sub

    'Konstruktor für Entity
    Public Sub New(pLieferungEntity As LieferungEntity)
        mlieferID = pLieferungEntity.lieferIdPk
        mdatAnfang = pLieferungEntity.datAnfang
        mdatEnde = pLieferungEntity.datEnde
        mbestID = pLieferungEntity.bestIdFk
        mliefID = pLieferungEntity.liefIdFk
    End Sub

    'Properties
    Public Property LieferungID As Integer
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

    Public Property BestellungID As Integer
        Get
            Return mbestID
        End Get
        Set(value As Integer)
            mbestID = value
        End Set
    End Property

    Public Property LieferantID As Integer
        Get
            Return mliefID
        End Get
        Set(value As Integer)
            mliefID = value
        End Set
    End Property

    'Funktion
    Public Function gibAlsLieferungEntity() As LieferungEntity
        Dim liefEntity As New LieferungEntity
        liefEntity.lieferIdPk = LieferungID
        liefEntity.datAnfang = AnfangDatum
        liefEntity.datEnde = EndeDatum
        liefEntity.bestIdFk = BestellungID
        liefEntity.liefIdFk = LieferantID
        Return liefEntity
    End Function
End Class
