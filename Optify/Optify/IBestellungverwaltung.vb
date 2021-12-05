Imports System.ServiceModel

<ServiceContract()>
Public Interface IBestellungverwaltung

    <OperationContract()>
    Function alleBestellungenLaden() As List(Of Bestellung)

    <OperationContract()>
    Function BestellungOeffnen(pintBestID As Integer) As Bestellung

    <OperationContract()>
    Sub BestellungStornieren(pintBestID As Integer)

    <OperationContract()>
    Sub Bestellungspeichern(pBestellung As Bestellung)



End Interface
