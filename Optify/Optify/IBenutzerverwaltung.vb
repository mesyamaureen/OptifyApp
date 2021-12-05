Imports System.ServiceModel

' HINWEIS: Mit dem Befehl "Umbenennen" im Kontextmenü können Sie den Schnittstellennamen "IBenutzerverwaltung" sowohl im Code als auch in der Konfigurationsdatei ändern.
<ServiceContract()>
Public Interface IBenutzerverwaltung

    <OperationContract()>
    Function Einloggen(pben As Benutzer) As Benutzer


End Interface
