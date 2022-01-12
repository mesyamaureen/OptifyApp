B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

' Class BestellpositionverwaltungService
' Generiert mit dem WSDL2B4A-Generator Version 1.1 und unter GPL 3 zur Verfuegung gestellt.

' Attribute
Sub Class_Globals

	' Callback
	Private mactCallbackActivity As Object
	Private mstrCallbackSub As String
	Private mbolVerbose As Boolean

	' Service
 	Private mstrServiceUrl As String

	' Attriute für die Rückgabewerte
	Private mBestellpositionList As BestellpositionList
	Private mBestellposition As Bestellposition
	Private merstellenBestellungResult As Int
	Private mLieferantList As LieferantList
	Private mLieferung As Lieferung
	Private mLieferant As Lieferant

	' XML-Verarbeitung
	Private XMLParser As SaxParser
End Sub

' Konstruktor
Public Sub Initialize(pactCallbackActivity As Object) 

	' Callback
	mactCallbackActivity = pactCallbackActivity

	' Logging ausgeben
	mbolVerbose = False

	' Service
	mstrServiceUrl ="http://ia2.h2862667.stratoserver.net/grp01/api/wcf/Bestellpositionverwaltung.svc"
	' Initialisierung der Attribute für die Rückgabewerte
	mBestellpositionList.Initialize
	mBestellposition.Initialize
	merstellenBestellungResult = 0
	mLieferantList.Initialize
	mLieferung.Initialize

End Sub

' Properties
Public Sub setCallbackActivity(pactCallbackActivity As Object)
	mactCallbackActivity = pactCallbackActivity
End Sub

Public Sub setCallbackSub(pstrCallbackSub As String)
	mstrCallbackSub = pstrCallbackSub
End Sub

Public Sub setVerbose(pbolVerbose As Boolean)
	mbolVerbose = pbolVerbose
End Sub

' Operationen
Public Sub gibBestellpositionenAsync(pintBestID As Int) As BestellpositionList
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBestellpositionverwaltung/gibBestellpositionen"

	job.Initialize("gibBestellpositionenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_gibbestellpositionen.xml")
	msg = msg.Replace("$PINTBESTID$",pintBestID)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub hinzufInWarenkorbAsync(pWare As Ware, paktKunde As Kunde, pintAnzahl As Int) As Bestellposition
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBestellpositionverwaltung/hinzufInWarenkorb"

	job.Initialize("hinzufInWarenkorbResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_hinzufinwarenkorb.xml")
	' pWare
	msg = msg.Replace("$PWARE_BESCHREIBUNG$",pWare.Beschreibung)
	msg = msg.Replace("$PWARE_BEZEICHNUNG$",pWare.Bezeichnung)
	msg = msg.Replace("$PWARE_ID$",pWare.ID)
	msg = msg.Replace("$PWARE_PREIS$",pWare.Preis)
	' paktKunde
	msg = msg.Replace("$PINTANZAHL$",pintAnzahl)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub loeschenBestellpositionAsync(pintBestPoId As Int)
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBestellpositionverwaltung/loeschenBestellposition"

	job.Initialize("loeschenBestellpositionResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_loeschenbestellposition.xml")
	msg = msg.Replace("$PINTBESTPOID$",pintBestPoId)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub erstellenBestellungAsync(pBestellung As Bestellung, pintKundeID As Int) As Int
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBestellpositionverwaltung/erstellenBestellung"

	job.Initialize("erstellenBestellungResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_erstellenbestellung.xml")
	' pBestellung
	msg = msg.Replace("$PBESTELLUNG_BESTELLUNGID$",pBestellung.BestellungID)
	msg = msg.Replace("$PBESTELLUNG_DATUMBESTELLUNG$",DateTime.Date(pBestellung.DatumBestellung))
	msg = msg.Replace("$PBESTELLUNG_KUNDENID$",pBestellung.KundenID)
	msg = msg.Replace("$PBESTELLUNG_PREIS$",pBestellung.Preis)
	msg = msg.Replace("$PBESTELLUNG_STATUS$",pBestellung.Status)
	msg = msg.Replace("$PINTKUNDEID$",pintKundeID)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub gibLieferantenAsync() As LieferantList
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBestellpositionverwaltung/gibLieferanten"

	job.Initialize("gibLieferantenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_giblieferanten.xml")

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub erstellenLieferungAsync(pintBestId As Int, pintLiefId As Int) As Lieferung
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBestellpositionverwaltung/erstellenLieferung"

	job.Initialize("erstellenLieferungResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_erstellenlieferung.xml")
	msg = msg.Replace("$PINTBESTID$",pintBestId)
	msg = msg.Replace("$PINTLIEFID$",pintLiefId)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Private Sub JobDone (Job As HttpJob)

	Dim strCallbackSub As String

	If mbolVerbose Then
		Log("JobName = " & Job.JobName & ", Success = " & Job.Success)
	End If

	If Job.Success = True Then
		If mbolVerbose Then
			Log(Job.GetString)
		End If
		If Job.JobName = "gibBestellpositionenResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			gibBestellpositionenResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mBestellpositionList)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mBestellpositionList)
			End If
		Else If Job.JobName = "hinzufInWarenkorbResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			hinzufInWarenkorbResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mBestellposition)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mBestellposition)
			End If
		Else If Job.JobName = "erstellenBestellungResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			erstellenBestellungResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, merstellenBestellungResult)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, merstellenBestellungResult)
			End If
		Else If Job.JobName = "gibLieferantenResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			gibLieferantenResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mLieferantList)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mLieferantList)
			End If
		Else If Job.JobName = "erstellenLieferungResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			erstellenLieferungResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mLieferung)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mLieferung)
			End If
		Else
			' In allen anderen Fällen direkte Rückkehr zum Aufrufer, weil keine XML-Antwort zu verarbeiten ist
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub(mactCallbackActivity, mstrCallbackSub)
			Else
				CallSub(mactCallbackActivity, strCallbackSub)
			End If
		End If
	Else
		Log("Error: " & Job.ErrorMessage)
		Job.Release
	End If

End Sub

Private Sub gibBestellpositionenResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "gibBestellpositionenResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub hinzufInWarenkorbResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "hinzufInWarenkorbResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub erstellenBestellungResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "erstellenBestellungResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub gibLieferantenResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "gibLieferantenResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub erstellenLieferungResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "erstellenLieferungResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub gibBestellpositionenResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "gibBestellpositionenResult"
			Dim mBestellpositionList As BestellpositionList
			mBestellpositionList.Initialize
		Case "Bestellposition"
			Dim mBestellposition As Bestellposition
			mBestellposition.Initialize
		Case "Anzahl"
			' Nichts zu tun
		Case "BestellpositionID"
			' Nichts zu tun
		Case "BestellungID"
			' Nichts zu tun
		Case "WareID"
			' Nichts zu tun
	End Select

End Sub

Private Sub hinzufInWarenkorbResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "hinzufInWarenkorbResult"
			Dim mBestellposition As Bestellposition
			mBestellposition.Initialize
		Case "Anzahl"
			' Nichts zu tun
		Case "BestellpositionID"
			' Nichts zu tun
		Case "BestellungID"
			' Nichts zu tun
		Case "WareID"
			' Nichts zu tun
	End Select

End Sub

Private Sub erstellenBestellungResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "erstellenBestellungResult"
			' Nichts zu tun
	End Select

End Sub

Private Sub gibLieferantenResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "gibLieferantenResult"
			Dim mLieferantList As LieferantList
			mLieferantList.Initialize
		Case "Lieferant"
			Dim mLieferant As Lieferant
			mLieferant.Initialize
	End Select

End Sub

Private Sub erstellenLieferungResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "erstellenLieferungResult"
			Dim mLieferung As Lieferung
			mLieferung.Initialize
		Case "AnfangDatum"
			' Nichts zu tun
		Case "BestellungID"
			' Nichts zu tun
		Case "EndeDatum"
			' Nichts zu tun
		Case "LieferantID"
			' Nichts zu tun
		Case "LieferungID"
			' Nichts zu tun
	End Select

End Sub

Private Sub gibBestellpositionenResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "gibBestellpositionenResult"
			' Nichts zu tun
		Case "Bestellposition"
			mBestellpositionList.Add(mBestellposition)
		Case "Anzahl"
			mBestellposition.Anzahl = Text.ToString
		Case "BestellpositionID"
			mBestellposition.BestellpositionID = Text.ToString
		Case "BestellungID"
			mBestellposition.BestellungID = Text.ToString
		Case "WareID"
			mBestellposition.WareID = Text.ToString
	End Select

End Sub

Private Sub hinzufInWarenkorbResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "hinzufInWarenkorbResult"
			' Nichts zu tun
		Case "Anzahl"
			mBestellposition.Anzahl = Text.ToString
		Case "BestellpositionID"
			mBestellposition.BestellpositionID = Text.ToString
		Case "BestellungID"
			mBestellposition.BestellungID = Text.ToString
		Case "WareID"
			mBestellposition.WareID = Text.ToString
	End Select

End Sub

Private Sub erstellenBestellungResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "erstellenBestellungResult"
			merstellenBestellungResult = Text.ToString
	End Select

End Sub

Private Sub gibLieferantenResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "gibLieferantenResult"
			' Nichts zu tun
		Case "Lieferant"
			mLieferantList.Add(mLieferant)
	End Select

End Sub

Private Sub erstellenLieferungResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "erstellenLieferungResult"
			' Nichts zu tun
		Case "AnfangDatum"
			mLieferung.AnfangDatum = DateTime.DateParse(Text.ToString)
		Case "BestellungID"
			mLieferung.BestellungID = Text.ToString
		Case "EndeDatum"
			mLieferung.EndeDatum = DateTime.DateParse(Text.ToString)
		Case "LieferantID"
			mLieferung.LieferantID = Text.ToString
		Case "LieferungID"
			mLieferung.LieferungID = Text.ToString
	End Select

End Sub

