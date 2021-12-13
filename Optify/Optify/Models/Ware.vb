Public Class Ware

    'Attribute
    Dim mintWID As Integer
    Dim mstrBezeichnung As String
    Dim mdblWPreis As Double
    Dim mstrBeschreibung As String
    'Dim mBild As Image

    Public Sub New()
        mintWID = -1
        mstrBezeichnung = String.Empty
        mdblWPreis = 0
        mstrBeschreibung = String.Empty
        'mbild?
    End Sub

    Public Sub New(pintWID As Integer, pstrBezeichnung As String, pdblWPreis As Double, pstrBeschreibung As String)
        mintWID = pintWID
        mstrBezeichnung = pstrBezeichnung
        mdblWPreis = pdblWPreis
        mstrBeschreibung = pstrBeschreibung
        'bild?
    End Sub

    Public Sub New(pWareEntity As WareEntity)
        mintWID = pWareEntity.wIdPk
        mstrBezeichnung = pWareEntity.wBezeichnung
        mstrBeschreibung = pWareEntity.wBeschreibung
        mdblWPreis = pWareEntity.wPreis
        'bild?
    End Sub


    Public Property ID As Integer
        Get
            Return mintWID
        End Get
        Set(value As Integer)
            mintWID = value
        End Set
    End Property

    Public Property Bezeichnung As String
        Get
            Return mstrBezeichnung
        End Get
        Set(value As String)
            mstrBezeichnung = value
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

    Public Property Beschreibung As String
        Get
            Return mstrBeschreibung
        End Get
        Set(value As String)
            mstrBeschreibung = value
        End Set
    End Property

    Public Function gibAlsEntity() As WareEntity
        Dim wEntity As New WareEntity
        wEntity.wIdPk = mintWID
        wEntity.wBezeichnung = mstrBezeichnung
        wEntity.wPreis = mdblWPreis
        wEntity.wBeschreibung = mstrBeschreibung
        Return wEntity
    End Function

End Class
