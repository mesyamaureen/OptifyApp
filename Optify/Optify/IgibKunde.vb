Imports System.ServiceModel

' HINWEIS: Mit dem Befehl "Umbenennen" im Kontextmenü können Sie den Schnittstellennamen "IgibKunde" sowohl im Code als auch in der Konfigurationsdatei ändern.
<ServiceContract()>
Public Interface IgibKunde

    <OperationContract()>
    Function gibKunde(pstrBenutzername As String, pstrPasswort As String) As Kunde



End Interface
