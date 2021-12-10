B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

' Class WarenverwaltungServiceService
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
	Private mWareList As WareList
	Private mWare As Ware
	Private mwareHinzufuegenResult As Int

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
	mstrServiceUrl ="http://ia2.h2862667.stratoserver.net/grp01/api/wcf/WarenverwaltungService.svc"
	' Initialisierung der Attribute für die Rückgabewerte
	mWareList.Initialize
	mWare.Initialize
	mwareHinzufuegenResult = 0

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
Public Sub alleWarenLadenAsync() As WareList
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IWarenverwaltungService/alleWarenLaden"

	job.Initialize("alleWarenLadenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_allewarenladen.xml")

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub wareOeffnenAsync(pIntId As Int) As Ware
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IWarenverwaltungService/wareOeffnen"

	job.Initialize("wareOeffnenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_wareoeffnen.xml")
	msg = msg.Replace("$PINTID$",pIntId)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub wareLoeschenAsync(pintId As Int)
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IWarenverwaltungService/wareLoeschen"

	job.Initialize("wareLoeschenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_wareloeschen.xml")
	msg = msg.Replace("$PINTID$",pintId)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub wareSpeichernAsync(pWare As Ware)
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IWarenverwaltungService/wareSpeichern"

	job.Initialize("wareSpeichernResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_warespeichern.xml")
	' pWare
	msg = msg.Replace("$PWARE_ID$",pWare.ID)
	msg = msg.Replace("$PWARE_PREIS$",pWare.Preis)
	msg = msg.Replace("$PWARE_TYP$",pWare.Typ)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub wareHinzufuegenAsync(pWare As Ware) As Int
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IWarenverwaltungService/wareHinzufuegen"

	job.Initialize("wareHinzufuegenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_warehinzufuegen.xml")
	' pWare
	msg = msg.Replace("$PWARE_ID$",pWare.ID)
	msg = msg.Replace("$PWARE_PREIS$",pWare.Preis)
	msg = msg.Replace("$PWARE_TYP$",pWare.Typ)

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
		If Job.JobName = "alleWarenLadenResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			alleWarenLadenResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mWareList)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mWareList)
			End If
		Else If Job.JobName = "wareOeffnenResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			wareOeffnenResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mWare)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mWare)
			End If
		Else If Job.JobName = "wareHinzufuegenResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			wareHinzufuegenResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mwareHinzufuegenResult)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mwareHinzufuegenResult)
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

Private Sub alleWarenLadenResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "alleWarenLadenResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub wareOeffnenResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "wareOeffnenResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub wareHinzufuegenResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "wareHinzufuegenResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub alleWarenLadenResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "alleWarenLadenResult"
			Dim mWareList As WareList
			mWareList.Initialize
		Case "Ware"
			Dim mWare As Ware
			mWare.Initialize
		Case "ID"
			' Nichts zu tun
		Case "Preis"
			' Nichts zu tun
		Case "Typ"
			' Nichts zu tun
	End Select

End Sub

Private Sub wareOeffnenResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "wareOeffnenResult"
			Dim mWare As Ware
			mWare.Initialize
		Case "ID"
			' Nichts zu tun
		Case "Preis"
			' Nichts zu tun
		Case "Typ"
			' Nichts zu tun
	End Select

End Sub

Private Sub wareHinzufuegenResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "wareHinzufuegenResult"
			' Nichts zu tun
	End Select

End Sub

Private Sub alleWarenLadenResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "alleWarenLadenResult"
			' Nichts zu tun
		Case "Ware"
			mWareList.Add(mWare)
		Case "ID"
			mWare.ID = Text.ToString
		Case "Preis"
			mWare.Preis = Text.ToString
		Case "Typ"
			mWare.Typ = Text.ToString
	End Select

End Sub

Private Sub wareOeffnenResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "wareOeffnenResult"
			' Nichts zu tun
		Case "ID"
			mWare.ID = Text.ToString
		Case "Preis"
			mWare.Preis = Text.ToString
		Case "Typ"
			mWare.Typ = Text.ToString
	End Select

End Sub

Private Sub wareHinzufuegenResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "wareHinzufuegenResult"
			mwareHinzufuegenResult = Text.ToString
	End Select

End Sub

