﻿'------------------------------------------------------------------------------
' <auto-generated>
'     Der Code wurde von einer Vorlage generiert.
'
'     Manuelle Änderungen an dieser Datei führen möglicherweise zu unerwartetem Verhalten der Anwendung.
'     Manuelle Änderungen an dieser Datei werden überschrieben, wenn der Code neu generiert wird.
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Data.Entity
Imports System.Data.Entity.Infrastructure

Partial Public Class OptifyEntities1
    Inherits DbContext

    Public Sub New()
        MyBase.New("name=OptifyEntities1")
    End Sub

    Protected Overrides Sub OnModelCreating(modelBuilder As DbModelBuilder)
        Throw New UnintentionalCodeFirstException()
    End Sub

    Public Overridable Property tblBestellpositionen() As DbSet(Of BestellpositionEntity)
    Public Overridable Property tblBestellungen() As DbSet(Of BestellungEntity)
    Public Overridable Property tblKunde() As DbSet(Of KundeEntity)
    Public Overridable Property tblLieferanten() As DbSet(Of LieferantEntity)
    Public Overridable Property tblLieferungen() As DbSet(Of LieferungEntity)
    Public Overridable Property tblMitarbeiter() As DbSet(Of MitarbeiterEntity)
    Public Overridable Property tblWaren() As DbSet(Of WareEntity)

End Class
