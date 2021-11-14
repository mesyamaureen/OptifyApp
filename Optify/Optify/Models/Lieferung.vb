Public Class Lieferung
    'Attribut
    Dim mlieferID As Integer
    Dim mdatAnfang As Date
    Dim mdatEnde As Date
    Dim mintBestellung As Integer

    'Konstruktor
    Public Sub New()
        mlieferID = -1
        mdatAnfang = Date.MinValue
        mdatEnde = Date.MaxValue
        mintBestellung = Nothing
    End Sub

    'Konstruktor für Entity
    Public Sub New(pLieferungEntity As LieferungEntity)
        mlieferID = pLieferungEntity.lieferIdPk
        mdatAnfang = pLieferungEntity.datAnfang
        mdatEnde = pLieferungEntity.datEnde
        mintBestellung = pLieferungEntity.bestIdFk


        'If IsNothing(pBestellungEntity.bestVersion) Then
        '    mbytVersion = Nothing
        'Else
        '    mbytVersion = pBestellungEntity.bestVersion
        'End If

        'mbrBranche = New Branche(pJobanzeigeEntity.JaBrIdFk, "")
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

    Public Property Bestellung As Integer
        Get
            Return mintBestellung
        End Get
        Set(value As Integer)
            mintBestellung = value
        End Set
    End Property

    'Funktion
    Public Function gibAlsLieferungEntity() As LieferungEntity
        Dim liefEntity As LieferungEntity
        liefEntity = New LieferungEntity
        liefEntity.lieferIdPk = ID
        liefEntity.datAnfang = AnfangDatum
        liefEntity.datEnde = EndeDatum
        liefEntity.bestIdFk = Bestellung
        Return liefEntity
    End Function
End Class
