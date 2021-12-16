Imports System.ServiceModel

' HINWEIS: Mit dem Befehl "Umbenennen" im Kontextmenü können Sie den Schnittstellennamen "IBestellpositionverwaltung" sowohl im Code als auch in der Konfigurationsdatei ändern.
<ServiceContract()>
Public Interface IBestellpositionverwaltung

    <OperationContract()>
    Function gibBestellpositionen(pintBestID As Integer) As List(Of Bestellposition)

    <OperationContract>
    Function hinzufInWarenkorb(pWare As Ware, paktKunde As Kunde, pintAnzahl As Integer) As Bestellposition

    <OperationContract>
    Sub loeschenBestellposition(pintBestPoId As Integer)

    <OperationContract>
    Function erstellenBestellung(pBestellung As Bestellung, pintKundeID As Integer) As Integer

    <OperationContract>
    Function gibLieferanten() As List(Of Lieferant)
    <OperationContract>
    Function erstellenLieferung(pintBestId As Integer, pintLiefId As Integer) As Lieferung

End Interface
