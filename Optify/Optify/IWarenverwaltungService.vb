Imports System.ServiceModel

' HINWEIS: Mit dem Befehl "Umbenennen" im Kontextmenü können Sie den Schnittstellennamen "IWarenverwaltungService" sowohl im Code als auch in der Konfigurationsdatei ändern.
<ServiceContract()>
Public Interface IWarenverwaltungService

    <OperationContract()>
    Function alleWarenLaden() As List(Of Ware)

    Function wareOeffnen(pIntId As Integer) As Ware

    Sub wareLoeschen()


    Sub wareSpeichern()

    Sub wareHinzufuegen()




    'AlleWarenLaden() -WareOeffnen() WareLoeschen() WareSpeichern()
End Interface
