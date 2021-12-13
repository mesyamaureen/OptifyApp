Public Class Benutzer
    'Attribute
    Private mbenID As Integer
    Private mstrName As String
    Private mstrVorname As String
    Private mstrBenutzername As String
    Private mstrPasswort As String
    'Private mbenTyp As String

    'Konstruktor
    Public Sub New()
        mbenID = -1
        mstrName = String.Empty
        mstrVorname = String.Empty
        mstrBenutzername = String.Empty
        mstrPasswort = String.Empty
        'mbenTyp = String.Empty
    End Sub

    'Parameterloser Konstruktor
    Public Sub New(pbenID As Integer, pstrName As String,
              pstrVorname As String, pstrBenutzername As String, pstrPasswort As String) ', pbenTyp As String
        mbenID = pbenID
        mstrName = pstrName
        mstrVorname = pstrVorname
        mstrBenutzername = pstrBenutzername
        mstrPasswort = pstrPasswort
        'mbenTyp = pbenTyp
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

    'Public Property Typ As String
    '    Get
    '        Return mbenTyp
    '    End Get
    '    Set(value As String)
    '        mbenTyp = value
    '    End Set
    'End Property
End Class
