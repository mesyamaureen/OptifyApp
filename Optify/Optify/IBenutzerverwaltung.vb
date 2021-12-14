Imports System.ServiceModel

' HINWEIS: Mit dem Befehl "Umbenennen" im Kontextmenü können Sie den Schnittstellennamen "IBenutzerverwaltung" sowohl im Code als auch in der Konfigurationsdatei ändern.
<ServiceContract()>
Public Interface IBenutzerverwaltung

    '<OperationContract()>
    'Function Einloggen(pstrBenutzername As String, pstrPasswort As String) As Benutzer

    '<OperationContract()>
    'Function gibKunde(pBen As Benutzer) As Kunde

    '<OperationContract()>
    'Function gibLieferant(pBen As Benutzer) As Lieferant

    '<OperationContract()>
    'Function gibMitarbeiter(pBen As Benutzer) As Mitarbeiter

End Interface
