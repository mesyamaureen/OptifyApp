Imports System.ServiceModel

<ServiceContract()>
Public Interface IBestellungverwaltung

    <OperationContract()>
    Function gibBestellungen() As List(Of Bestellung)

    <OperationContract()>
    Function BestellungOeffnen(pintBestID As Integer) As Bestellung

    <OperationContract()>
    Sub BestellungBearbeiten(pBestellung As Bestellung)

    <OperationContract()>
    Sub BestellungStornieren(pintBestID As Integer)

    <OperationContract()>
    Sub Bestellungspeichern(pBestellung As Bestellung)



End Interface
