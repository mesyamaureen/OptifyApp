Imports System.ServiceModel

' HINWEIS: Mit dem Befehl "Umbenennen" im Kontextmenü können Sie den Schnittstellennamen "ILieferungverwaltung" sowohl im Code als auch in der Konfigurationsdatei ändern.
<ServiceContract()>
Public Interface ILieferungverwaltung

    <OperationContract()>
    Function gibLieferungen() As List(Of Lieferung)
    <OperationContract()>
    Function LieferungOeffnen(pintLiefID As Integer)
    <OperationContract()>
    Sub hinzufuegenLieferung(pLieferung As Lieferung)
    <OperationContract()>
    Sub loeschenLieferung(pliefId As Integer)

End Interface
