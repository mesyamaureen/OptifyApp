B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

' Class BestellungverwaltungService
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
	Private mBestellungList As BestellungList
	Private mBestellung As Bestellung

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
	mstrServiceUrl ="http://ia2.h2862667.stratoserver.net/grp01/api/wcf/Bestellungverwaltung.svc"
	' Initialisierung der Attribute für die Rückgabewerte
	mBestellungList.Initialize
	mBestellung.Initialize

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
Public Sub alleBestellungenLadenAsync() As BestellungList
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBestellungverwaltung/alleBestellungenLaden"

	job.Initialize("alleBestellungenLadenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_allebestellungenladen.xml")

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub BestellungOeffnenAsync(pintBestID As Int) As Bestellung
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBestellungverwaltung/BestellungOeffnen"

	job.Initialize("BestellungOeffnenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_bestellungoeffnen.xml")
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

Public Sub BestellungStornierenAsync(pintBestID As Int)
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBestellungverwaltung/BestellungStornieren"

	job.Initialize("BestellungStornierenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_bestellungstornieren.xml")
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

Public Sub BestellungspeichernAsync(pBestellung As Bestellung)
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBestellungverwaltung/Bestellungspeichern"

	job.Initialize("BestellungspeichernResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_bestellungspeichern.xml")
	' pBestellung
	msg = msg.Replace("$PBESTELLUNG_BESTELLUNGID$",pBestellung.BestellungID)
	msg = msg.Replace("$PBESTELLUNG_DATUMBESTELLUNG$",DateTime.Date(pBestellung.DatumBestellung))
	msg = msg.Replace("$PBESTELLUNG_KUNDENID$",pBestellung.KundenID)
	msg = msg.Replace("$PBESTELLUNG_PREIS$",pBestellung.Preis)
	msg = msg.Replace("$PBESTELLUNG_STATUS$",pBestellung.Status)

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
		If Job.JobName = "alleBestellungenLadenResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			alleBestellungenLadenResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mBestellungList)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mBestellungList)
			End If
		Else If Job.JobName = "BestellungOeffnenResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			BestellungOeffnenResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mBestellung)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mBestellung)
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

Private Sub alleBestellungenLadenResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "alleBestellungenLadenResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub BestellungOeffnenResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "BestellungOeffnenResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub alleBestellungenLadenResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "alleBestellungenLadenResult"
			Dim mBestellungList As BestellungList
			mBestellungList.Initialize
		Case "Bestellung"
			Dim mBestellung As Bestellung
			mBestellung.Initialize
		Case "BestellungID"
			' Nichts zu tun
		Case "DatumBestellung"
			' Nichts zu tun
		Case "KundenID"
			' Nichts zu tun
		Case "Preis"
			' Nichts zu tun
		Case "Status"
			' Nichts zu tun
	End Select

End Sub

Private Sub BestellungOeffnenResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "BestellungOeffnenResult"
			Dim mBestellung As Bestellung
			mBestellung.Initialize
		Case "BestellungID"
			' Nichts zu tun
		Case "DatumBestellung"
			' Nichts zu tun
		Case "KundenID"
			' Nichts zu tun
		Case "Preis"
			' Nichts zu tun
		Case "Status"
			' Nichts zu tun
	End Select

End Sub

Private Sub alleBestellungenLadenResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "alleBestellungenLadenResult"
			' Nichts zu tun
		Case "Bestellung"
			mBestellungList.Add(mBestellung)
		Case "BestellungID"
			mBestellung.BestellungID = Text.ToString
		Case "DatumBestellung"
			mBestellung.DatumBestellung = DateTime.DateParse(Text.ToString)
		Case "KundenID"
			mBestellung.KundenID = Text.ToString
		Case "Preis"
			mBestellung.Preis = Text.ToString
		Case "Status"
			mBestellung.Status = Text.ToString
	End Select

End Sub

Private Sub BestellungOeffnenResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "BestellungOeffnenResult"
			' Nichts zu tun
		Case "BestellungID"
			mBestellung.BestellungID = Text.ToString
		Case "DatumBestellung"
			mBestellung.DatumBestellung = DateTime.DateParse(Text.ToString)
		Case "KundenID"
			mBestellung.KundenID = Text.ToString
		Case "Preis"
			mBestellung.Preis = Text.ToString
		Case "Status"
			mBestellung.Status = Text.ToString
	End Select

End Sub

