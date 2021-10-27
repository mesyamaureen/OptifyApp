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
End Class
