B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

' Class LieferungverwaltungService
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
	Private mLieferungList As LieferungList
	Private mLieferungOeffnenResult As Object
	Private mLieferung As Lieferung

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
	mstrServiceUrl ="http://ia2.h2862667.stratoserver.net/grp01/api/wcf/Lieferungverwaltung.svc"
	' Initialisierung der Attribute für die Rückgabewerte
	mLieferungList.Initialize
	mLieferungOeffnenResult = Null

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
Public Sub gibLieferungenAsync() As LieferungList
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/ILieferungverwaltung/gibLieferungen"

	job.Initialize("gibLieferungenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_giblieferungen.xml")

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub LieferungOeffnenAsync(pintLiefID As Int) As Lieferung
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/ILieferungverwaltung/LieferungOeffnen"

	job.Initialize("LieferungOeffnenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_lieferungoeffnen.xml")
	msg = msg.Replace("$PINTLIEFID$",pintLiefID)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub hinzufuegenLieferungAsync(pLieferung As Lieferung)
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/ILieferungverwaltung/hinzufuegenLieferung"

	job.Initialize("hinzufuegenLieferungResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_hinzufuegenlieferung.xml")
	' pLieferung
	msg = msg.Replace("$PLIEFERUNG_ANFANGDATUM$",DateTime.Date(pLieferung.AnfangDatum))
	msg = msg.Replace("$PLIEFERUNG_BESTELLUNGID$",pLieferung.BestellungID)
	msg = msg.Replace("$PLIEFERUNG_ENDEDATUM$",DateTime.Date(pLieferung.EndeDatum))
	msg = msg.Replace("$PLIEFERUNG_LIEFERANTID$",pLieferung.LieferantID)
	msg = msg.Replace("$PLIEFERUNG_LIEFERUNGID$",pLieferung.LieferungID)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub loeschenLieferungAsync(pliefId As Int)
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/ILieferungverwaltung/loeschenLieferung"

	job.Initialize("loeschenLieferungResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_loeschenlieferung.xml")
	msg = msg.Replace("$PLIEFID$",pliefId)

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
		If Job.JobName = "gibLieferungenResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			gibLieferungenResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mLieferungList)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mLieferungList)
			End If
		Else If Job.JobName = "LieferungOeffnenResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			LieferungOeffnenResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mLieferungOeffnenResult)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mLieferungOeffnenResult)
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

Private Sub gibLieferungenResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "gibLieferungenResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub LieferungOeffnenResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "LieferungOeffnenResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub gibLieferungenResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "gibLieferungenResult"
			Dim mLieferungList As LieferungList
			mLieferungList.Initialize
		Case "Lieferung"
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

Private Sub LieferungOeffnenResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "LieferungOeffnenResult"
			' Nichts zu tun
	End Select

End Sub

Private Sub gibLieferungenResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "gibLieferungenResult"
			' Nichts zu tun
		Case "Lieferung"
			mLieferungList.Add(mLieferung)
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

Private Sub LieferungOeffnenResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "LieferungOeffnenResult"
			mLieferungOeffnenResult = Text.ToString
	End Select

End Sub

