'------------------------------------------------------------------------------
' <auto-generated>
'     Der Code wurde von einer Vorlage generiert.
'
'     Manuelle Änderungen an dieser Datei führen möglicherweise zu unerwartetem Verhalten der Anwendung.
'     Manuelle Änderungen an dieser Datei werden überschrieben, wenn der Code neu generiert wird.
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Collections.Generic

Partial Public Class BenutzerEntity
    Public Property benIdPk As Integer
    Public Property strFirmenname As String
    Public Property strAdresse As String
    Public Property strName As String
    Public Property strVorname As String
    Public Property strBenutzername As String
    Public Property strPasswort As String
    Public Property strSteuerID As String
    Public Property benTyp As String
    Public Property benBestellungIdFk As Nullable(Of Integer)

    Public Overridable Property tblBestellungen As BestellungEntity
    Public Overridable Property tblLieferungen As ICollection(Of LieferungEntity) = New HashSet(Of LieferungEntity)

End Class