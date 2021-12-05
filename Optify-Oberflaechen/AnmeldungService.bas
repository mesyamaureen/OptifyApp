B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Service
Version=11
@EndOfDesignText@

'
' Class BenutzerServiceService
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
	Private manmeldenResult As Int
	Private mBenutzerList As BenutzerList
	Private mBenutzer As Benutzer

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
	mstrServiceUrl = "http://ia2.lehre.h2355379.stratoserver.net/demo/wcf/BenutzerService/BenutzerService.svc"
	' Initialisierung der Attribute für die Rückgabewerte
	manmeldenResult = 0
	mBenutzerList.Initialize
	mBenutzer.Initialize

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
Public Sub anmeldenAsync(pstrBenutzername As String, pstrPasswort As String) As Int
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBenutzerService/anmelden"

	job.Initialize("anmeldenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_anmelden.xml")
	msg = msg.Replace("$PSTRBENUTZERNAME$",pstrBenutzername)
	msg = msg.Replace("$PSTRPASSWORT$",pstrPasswort)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub

Public Sub gibBenutzerAlleAsync() As BenutzerList
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBenutzerService/gibBenutzerAlle"

	job.Initialize("gibBenutzerAlleResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_gibbenutzeralle.xml")

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub

Public Sub gibBenutzerAsync(pintId As Int) As Benutzer
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBenutzerService/gibBenutzer"

	job.Initialize("gibBenutzerResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_gibbenutzer.xml")
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

Public Sub loeschenBenutzerAsync(pintId As Int)
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBenutzerService/loeschenBenutzer"

	job.Initialize("loeschenBenutzerResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_loeschenbenutzer.xml")
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

Public Sub hinzufuegenBenutzerAsync(pBenutzer As Benutzer)
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBenutzerService/hinzufuegenBenutzer"

	job.Initialize("hinzufuegenBenutzerResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_hinzufuegenbenutzer.xml")
	' pBenutzer
	msg = msg.Replace("$PBENUTZER_BENUTZERNAME$",pBenutzer.Benutzername)
	msg = msg.Replace("$PBENUTZER_ID$",pBenutzer.Id)
	msg = msg.Replace("$PBENUTZER_ISTADMIN$",pBenutzer.IstAdmin)
	msg = msg.Replace("$PBENUTZER_NAME$",pBenutzer.Name)
	msg = msg.Replace("$PBENUTZER_PASSWORT$",pBenutzer.Passwort)
	msg = msg.Replace("$PBENUTZER_VORNAME$",pBenutzer.Vorname)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub

Public Sub aktualisierenBenutzerAsync(pBenutzer As Benutzer)
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IBenutzerService/aktualisierenBenutzer"

	job.Initialize("aktualisierenBenutzerResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_aktualisierenbenutzer.xml")
	' pBenutzer
	msg = msg.Replace("$PBENUTZER_BENUTZERNAME$",pBenutzer.Benutzername)
	msg = msg.Replace("$PBENUTZER_ID$",pBenutzer.Id)
	msg = msg.Replace("$PBENUTZER_ISTADMIN$",pBenutzer.IstAdmin)
	msg = msg.Replace("$PBENUTZER_NAME$",pBenutzer.Name)
	msg = msg.Replace("$PBENUTZER_PASSWORT$",pBenutzer.Passwort)
	msg = msg.Replace("$PBENUTZER_VORNAME$",pBenutzer.Vorname)

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
		If Job.JobName = "anmeldenResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			anmeldenResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, manmeldenResult)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, manmeldenResult)
			End If
		Else If Job.JobName = "gibBenutzerAlleResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			gibBenutzerAlleResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mBenutzerList)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mBenutzerList)
			End If
		Else If Job.JobName = "gibBenutzerResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			gibBenutzerResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mBenutzer)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mBenutzer)
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

Private Sub anmeldenResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "anmeldenResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub gibBenutzerAlleResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "gibBenutzerAlleResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub gibBenutzerResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "gibBenutzerResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub anmeldenResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "anmeldenResult"
			' Nichts zu tun
	End Select

End Sub

Private Sub gibBenutzerAlleResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "gibBenutzerAlleResult"
			Dim mBenutzerList As BenutzerList
			mBenutzerList.Initialize
		Case "Benutzer"
			Dim mBenutzer As Benutzer
			mBenutzer.Initialize
		Case "Benutzername"
			' Nichts zu tun
		Case "Id"
			' Nichts zu tun
		Case "IstAdmin"
			' Nichts zu tun
		Case "Name"
			' Nichts zu tun
		Case "Passwort"
			' Nichts zu tun
		Case "Vorname"
			' Nichts zu tun
	End Select

End Sub

Private Sub gibBenutzerResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "gibBenutzerResult"
			Dim mBenutzer As Benutzer
			mBenutzer.Initialize
		Case "Benutzername"
			' Nichts zu tun
		Case "Id"
			' Nichts zu tun
		Case "IstAdmin"
			' Nichts zu tun
		Case "Name"
			' Nichts zu tun
		Case "Passwort"
			' Nichts zu tun
		Case "Vorname"
			' Nichts zu tun
	End Select

End Sub

Private Sub anmeldenResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "anmeldenResult"
			manmeldenResult = Text.ToString
	End Select

End Sub

Private Sub gibBenutzerAlleResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "gibBenutzerAlleResult"
			' Nichts zu tun
		Case "Benutzer"
			mBenutzerList.Add(mBenutzer)
		Case "Benutzername"
			mBenutzer.Benutzername = Text.ToString
		Case "Id"
			mBenutzer.Id = Text.ToString
		Case "IstAdmin"
			mBenutzer.IstAdmin = Text.ToString
		Case "Name"
			mBenutzer.Name = Text.ToString
		Case "Passwort"
			mBenutzer.Passwort = Text.ToString
		Case "Vorname"
			mBenutzer.Vorname = Text.ToString
	End Select

End Sub

Private Sub gibBenutzerResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "gibBenutzerResult"
			' Nichts zu tun
		Case "Benutzername"
			mBenutzer.Benutzername = Text.ToString
		Case "Id"
			mBenutzer.Id = Text.ToString
		Case "IstAdmin"
			mBenutzer.IstAdmin = Text.ToString
		Case "Name"
			mBenutzer.Name = Text.ToString
		Case "Passwort"
			mBenutzer.Passwort = Text.ToString
		Case "Vorname"
			mBenutzer.Vorname = Text.ToString
	End Select

End Sub

