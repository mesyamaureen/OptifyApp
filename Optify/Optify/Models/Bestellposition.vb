Public Class Bestellposition
    Private mbestPoID As Long
    Private mbestBestellungID As String
    Private mwareID As String
    Private mintAnzahl As Integer

    Sub New()

    End Sub

    Sub New(pbestPoID As Long, pbestBestellungID As String, pwareID As String)
        mbestPoID = pbestPoID
        mbestBestellungID = pbestBestellungID
        mwareID = pwareID
    End Sub

    'Konstruktor Entity
    Sub New(pbestPoEntity As BestellpositionEntity)
        mbestPoID = pbestPoEntity.bestPoIdPk
        mbestBestellungID = pbestPoEntity.bestPoBestIdFk
        mwareID = pbestPoEntity.bestPoWIdFk
        mintAnzahl = pbestPoEntity.bestPoAnzahl
    End Sub

    Public Property BestellpositionID As Integer
        Get
            Return mbestPoID
        End Get
        Set(value As Integer)
            mbestPoID = value
        End Set
    End Property

    Public Property BestellungID As Integer
        Get
            Return mbestBestellungID
        End Get
        Set(value As Integer)
            mbestBestellungID = value
        End Set
    End Property

    Public Property WareID As Integer
        Get
            Return mwareID
        End Get
        Set(value As Integer)
            mwareID = value
        End Set
    End Property

    Public Property Anzahl As Integer
        Get
            Return mintAnzahl
        End Get
        Set(value As Integer)
            mintAnzahl = value
        End Set
    End Property
End Class
