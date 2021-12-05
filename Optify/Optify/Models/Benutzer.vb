Public Class Benutzer
    'Attribute
    Dim mbenID As Integer
    Dim mstrFirmenname As String
    Dim mstrAdresse As String
    Dim mstrName As String
    Dim mstrVorname As String
    Dim mstrBenutzername As String
    Dim mstrPasswort As String
    Dim mstrSteuerID As String

    'Konstruktor
    Public Sub New()
        mbenID = -1
        mstrFirmenname = String.Empty
        mstrAdresse = String.Empty
        mstrName = String.Empty
        mstrVorname = String.Empty
        mstrBenutzername = String.Empty
        mstrPasswort = String.Empty
        mstrSteuerID = String.Empty
    End Sub

    'Parameterloser Konstruktor
    Sub New(pbenID As Integer, pstrFirmenname As String, pstrAdresse As String, pstrName As String,
              pstrVorname As String, pstrBenutzername As String, pstrPasswort As String, pstrSteuerID As String)
        mbenID = pbenID
        mstrFirmenname = pstrFirmenname
        mstrAdresse = pstrAdresse
        mstrName = pstrName
        mstrVorname = pstrVorname
        mstrBenutzername = pstrBenutzername
        mstrPasswort = pstrPasswort
        mstrSteuerID = pstrSteuerID
    End Sub

    'Entity Konstruktor
    Sub New(pbenEntity As BenutzerEntity)
        mbenID = pbenEntity.benIdPk
        mstrFirmenname = pbenEntity.strFirmenname
        mstrAdresse = pbenEntity.strAdresse
        mstrName = pbenEntity.strName
        mstrVorname = pbenEntity.strVorname
        mstrBenutzername = pbenEntity.strBenutzername
        mstrPasswort = pbenEntity.strPasswort
        mstrSteuerID = pbenEntity.strSteuerID
    End Sub

    'Properties
    Public Property BenutzerID As Integer
        Get
            Return mbenID
        End Get
        Set(value As Integer)
            mbenID = value
        End Set
    End Property

    Public Property Firmenname As String
        Get
            Return mstrFirmenname
        End Get
        Set(value As String)
            mstrFirmenname = value
        End Set
    End Property
    Public Property Adresse As String
        Get
            Return mstrAdresse
        End Get
        Set(value As String)
            mstrAdresse = value
        End Set
    End Property
    Public Property Name As String
        Get
            Return mstrName
        End Get
        Set(value As String)
            mstrName = value
        End Set
    End Property
    Public Property Vorname As String
        Get
            Return mstrVorname
        End Get
        Set(value As String)
            mstrVorname = value
        End Set
    End Property
    Public Property Benutzername As String
        Get
            Return mstrBenutzername
        End Get
        Set(value As String)
            mstrBenutzername = value
        End Set
    End Property
    Public Property Passwort As String
        Get
            Return mstrPasswort
        End Get
        Set(value As String)
            mstrPasswort = value
        End Set
    End Property
    Public Property SteuerID As String
        Get
            Return mstrSteuerID
        End Get
        Set(value As String)
            mstrSteuerID = value
        End Set
    End Property

    Public Function gibAlsBenutzerEntity() As BenutzerEntity
        Dim benE As BenutzerEntity
        benE = New BenutzerEntity
        benE.benIdPk = mbenID
        benE.strFirmenname = mstrFirmenname
        benE.strAdresse = mstrAdresse
        benE.strName = mstrName
        benE.strVorname = mstrVorname
        benE.strBenutzername = mstrBenutzername
        benE.strPasswort = mstrPasswort
        benE.strSteuerID = mstrSteuerID
        Return benE
    End Function
End Class
