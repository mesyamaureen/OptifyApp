Public Class Ware

    'Attribute
    Dim mintWID As Integer
    Dim mstrWTyp As String
    Dim mdblWPreis As Double

    Public Sub New()
        mintWID = -1
        mstrWTyp = String.Empty
        mdblWPreis = 0

    End Sub

    Public Sub New(pWareEntity As WareEntity)
        mintWID = pWareEntity.wIdPk
        mstrWTyp = pWareEntity.wTyp
        mdblWPreis = pWareEntity.wPreis

    End Sub


    Public Property ID As Integer
        Get
            Return mintWID
        End Get
        Set(value As Integer)
            mintWID = value
        End Set
    End Property

    Public Property Typ As String
        Get
            Return mstrWTyp
        End Get
        Set(value As String)
            mstrWTyp = value
        End Set
    End Property


    Public Property Preis As Double
        Get
            Return mdblWPreis
        End Get
        Set(value As Double)
            mdblWPreis = value
        End Set
    End Property

    Public Function gibAlsEntity() As WareEntity
        Dim wEntity As New WareEntity

        wEntity = New WareEntity
        wEntity.wIdPk = mintWID
        wEntity.wTyp = mstrWTyp
        wEntity.wPreis = mdblWPreis
        Return wEntity


    End Function

End Class
