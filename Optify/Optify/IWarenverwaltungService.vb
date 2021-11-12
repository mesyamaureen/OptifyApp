Imports System.ServiceModel

' HINWEIS: Mit dem Befehl "Umbenennen" im Kontextmenü können Sie den Schnittstellennamen "IWarenverwaltungService" sowohl im Code als auch in der Konfigurationsdatei ändern.
<ServiceContract()>
Public Interface IWarenverwaltungService

    <OperationContract()>
    Function alleWarenLaden() As List(Of Ware)

    <OperationContract()>
    Function wareOeffnen(pIntId As Integer) As Ware

    <OperationContract()>
    Sub wareLoeschen(pintId As Integer)

    <OperationContract()>
    Sub wareSpeichern(pWare As Ware)

    <OperationContract()>
    Sub wareHinzufuegen(pWare As Ware)




End Interface
