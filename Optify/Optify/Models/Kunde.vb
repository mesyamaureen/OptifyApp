Public Class Kunde
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
        'Typ = String.Empty
    End Sub


    'Parameterloser Konstruktor
    Public Sub New(pbenID As Integer, pstrFirmenname As String, pstrAdresse As String, pstrName As String,
              pstrVorname As String, pstrBenutzername As String, pstrPasswort As String, pstrSteuerID As String) ', pbenTyp As String
        BenutzerID = pbenID
        mstrFirmenname = pstrFirmenname
        mstrAdresse = pstrAdresse
        Name = pstrName
        Vorname = pstrVorname
        Benutzername = pstrBenutzername
        Passwort = pstrPasswort
        mstrSteuerID = pstrSteuerID
        'Typ = pbenTyp
    End Sub


    'Entity Konstruktor
    Public Sub New(pkunEntity As KundeEntity)
        BenutzerID = pkunEntity.kunIdPk
        mstrFirmenname = pkunEntity.strFirmenname
        mstrAdresse = pkunEntity.strAdresse
        Name = pkunEntity.strName
        Vorname = pkunEntity.strVorname
        Benutzername = pkunEntity.strBenutzername
        Passwort = pkunEntity.strPasswort
        mstrSteuerID = pkunEntity.strSteuerID
        'Typ = pbenEntity.benTyp
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

    Public Function gibAlsKundeEntity() As KundeEntity
        Dim kunE As KundeEntity = New KundeEntity
        kunE.kunIdPk = BenutzerID
        kunE.strFirmenname = mstrFirmenname
        kunE.strAdresse = mstrAdresse
        kunE.strName = Name
        kunE.strVorname = Vorname
        kunE.strBenutzername = Benutzername
        kunE.strPasswort = Passwort
        kunE.strSteuerID = mstrSteuerID
        Return kunE
    End Function

End Class
