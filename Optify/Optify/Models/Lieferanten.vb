Public Class Lieferanten
    Inherits Benutzer
    Private mstrSteuerID As String
    Private mstrFirmenname As String
    Private mstrAdresse As String

    Sub New()
        BenutzerID = -1
        Name = String.Empty
        Vorname = String.Empty
        Benutzername = String.Empty
        Passwort = String.Empty
        mstrSteuerID = String.Empty
        mstrFirmenname = String.Empty
        mstrAdresse = String.Empty
        Typ = String.Empty
    End Sub

    'Parameterloser Konstruktor
    Public Sub New(pbenID As Integer, pstrFirmenname As String, pstrAdresse As String, pstrName As String,
              pstrVorname As String, pstrBenutzername As String, pstrPasswort As String, pstrSteuerID As String, pbenTyp As String)
        BenutzerID = pbenID
        mstrFirmenname = pstrFirmenname
        mstrAdresse = pstrAdresse
        Name = pstrName
        Vorname = pstrVorname
        Benutzername = pstrBenutzername
        Passwort = pstrPasswort
        mstrSteuerID = pstrSteuerID
        Typ = pbenTyp
    End Sub

    'Entity Konstruktor
    Public Sub New(pbenEntity As BenutzerEntity)
        BenutzerID = pbenEntity.benIdPk
        mstrFirmenname = pbenEntity.strFirmenname
        mstrAdresse = pbenEntity.strAdresse
        Name = pbenEntity.strName
        Vorname = pbenEntity.strVorname
        Benutzername = pbenEntity.strBenutzername
        Passwort = pbenEntity.strPasswort
        mstrSteuerID = pbenEntity.strSteuerID
        Typ = pbenEntity.benTyp
    End Sub

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

    Public Property SteuerID As String
        Get
            Return mstrSteuerID
        End Get
        Set(value As String)
            mstrSteuerID = value
        End Set
    End Property

    Public Overloads Function gibAlsBenutzerEntity() As BenutzerEntity
        Dim benE As BenutzerEntity
        benE = New BenutzerEntity
        benE.benIdPk = BenutzerID
        benE.strFirmenname = mstrFirmenname
        benE.strAdresse = mstrAdresse
        benE.strName = Name
        benE.strVorname = Vorname
        benE.strBenutzername = Benutzername
        benE.strPasswort = Passwort
        benE.strSteuerID = mstrSteuerID
        benE.benTyp = Typ
        Return benE
    End Function
End Class
