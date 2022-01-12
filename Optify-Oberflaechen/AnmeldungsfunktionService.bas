B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

' Class AnmeldungsfunktionService
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
	Private mBenutzer As Benutzer
	Private mKunde As Kunde
	Private mLieferant As Lieferant
	Private mMitarbeiter As Mitarbeiter

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
	mstrServiceUrl ="http://ia2.h2862667.stratoserver.net/grp01/api/wcf/Anmeldungsfunktion.svc"
	' Initialisierung der Attribute für die Rückgabewerte
	mBenutzer.Initialize
	mKunde.Initialize
	mLieferant.Initialize
	mMitarbeiter.Initialize

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
Public Sub EinloggenAsync(pstrBenutzername As String, pstrPasswort As String) As Benutzer
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IAnmeldungsfunktion/Einloggen"

	job.Initialize("EinloggenResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_einloggen.xml")
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

Public Sub gibKundeAsync(pBen As Benutzer) As Kunde
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IAnmeldungsfunktion/gibKunde"

	job.Initialize("gibKundeResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_gibkunde.xml")
	' pBen
	msg = msg.Replace("$PBEN_BENUTZERID$",pBen.BenutzerID)
	msg = msg.Replace("$PBEN_BENUTZERNAME$",pBen.Benutzername)
	msg = msg.Replace("$PBEN_NAME$",pBen.Name)
	msg = msg.Replace("$PBEN_PASSWORT$",pBen.Passwort)
	msg = msg.Replace("$PBEN_TYP$",pBen.Typ)
	msg = msg.Replace("$PBEN_VORNAME$",pBen.Vorname)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub gibLieferantAsync(pBen As Benutzer) As Lieferant
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IAnmeldungsfunktion/gibLieferant"

	job.Initialize("gibLieferantResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_giblieferant.xml")
	' pBen
	msg = msg.Replace("$PBEN_BENUTZERID$",pBen.BenutzerID)
	msg = msg.Replace("$PBEN_BENUTZERNAME$",pBen.Benutzername)
	msg = msg.Replace("$PBEN_NAME$",pBen.Name)
	msg = msg.Replace("$PBEN_PASSWORT$",pBen.Passwort)
	msg = msg.Replace("$PBEN_TYP$",pBen.Typ)
	msg = msg.Replace("$PBEN_VORNAME$",pBen.Vorname)

	If mbolVerbose Then
		Log(msg)
	End If


	' Datumsformat wieder zurückstellen
	DateTime.DateFormat = strDateFormat

	job.PostString(mstrServiceUrl, msg)
	job.GetRequest.SetContentType("text/xml; charset=utf-8")
	job.GetRequest.SetHeader("SOAPAction", strSoapAction)
End Sub 

Public Sub gibMitarbeiterAsync(pBen As Benutzer) As Mitarbeiter
	Dim job As HttpJob
	Dim msg As String
	Dim strSoapAction As String
	Dim strDateFormat As String

	' Datumsformat vorübergehend auf XML-Standard umstellen
	strDateFormat = DateTime.DateFormat
	DateTime.DateFormat="yyyy-MM-dd"

	strSoapAction = "http://tempuri.org/IAnmeldungsfunktion/gibMitarbeiter"

	job.Initialize("gibMitarbeiterResponse", Me)
	msg = File.ReadString(File.DirAssets, "request_gibmitarbeiter.xml")
	' pBen
	msg = msg.Replace("$PBEN_BENUTZERID$",pBen.BenutzerID)
	msg = msg.Replace("$PBEN_BENUTZERNAME$",pBen.Benutzername)
	msg = msg.Replace("$PBEN_NAME$",pBen.Name)
	msg = msg.Replace("$PBEN_PASSWORT$",pBen.Passwort)
	msg = msg.Replace("$PBEN_TYP$",pBen.Typ)
	msg = msg.Replace("$PBEN_VORNAME$",pBen.Vorname)

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
		If Job.JobName = "EinloggenResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			EinloggenResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mBenutzer)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mBenutzer)
			End If
		Else If Job.JobName = "gibKundeResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			gibKundeResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mKunde)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mKunde)
			End If
		Else If Job.JobName = "gibLieferantResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			gibLieferantResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mLieferant)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mLieferant)
			End If
		Else If Job.JobName = "gibMitarbeiterResponse" Then
			' Verarbeitung der XML-Antwort beginnen
			gibMitarbeiterResponseXml(Job.GetInputStream)
			strCallbackSub = Job.JobName
			Job.Release
			If mstrCallbackSub.Length > 0 Then
				CallSub2(mactCallbackActivity, mstrCallbackSub, mMitarbeiter)
			Else
				CallSub2(mactCallbackActivity, strCallbackSub, mMitarbeiter)
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

Private Sub EinloggenResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "EinloggenResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub gibKundeResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "gibKundeResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub gibLieferantResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "gibLieferantResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub gibMitarbeiterResponseXml(pinsXml As InputStream)

	XMLParser.Initialize

	DateTime.DateFormat="yyyy-MM-dd"
	XMLParser.Parse(pinsXml, "gibMitarbeiterResponseXmlParser")
	DateTime.DateFormat="dd.MM.yyyy"

End Sub

Private Sub EinloggenResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "EinloggenResult"
			Dim mBenutzer As Benutzer
			mBenutzer.Initialize
		Case "BenutzerID"
			' Nichts zu tun
		Case "Benutzername"
			' Nichts zu tun
		Case "Name"
			' Nichts zu tun
		Case "Passwort"
			' Nichts zu tun
		Case "Typ"
			' Nichts zu tun
		Case "Vorname"
			' Nichts zu tun
	End Select

End Sub

Private Sub gibKundeResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "gibKundeResult"
			Dim mKunde As Kunde
			mKunde.Initialize
	End Select

End Sub

Private Sub gibLieferantResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "gibLieferantResult"
			Dim mLieferant As Lieferant
			mLieferant.Initialize
	End Select

End Sub

Private Sub gibMitarbeiterResponseXmlParser_StartElement(Uri As String, Name As String, Attributes As Attributes)

	If mbolVerbose Then
		Log("Es beginnt: '" & Name & "'.")
	End If

	Select Name
		Case "gibMitarbeiterResult"
			Dim mMitarbeiter As Mitarbeiter
			mMitarbeiter.Initialize
	End Select

End Sub

Private Sub EinloggenResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "EinloggenResult"
			' Nichts zu tun
		Case "BenutzerID"
			mBenutzer.BenutzerID = Text.ToString
		Case "Benutzername"
			mBenutzer.Benutzername = Text.ToString
		Case "Name"
			mBenutzer.Name = Text.ToString
		Case "Passwort"
			mBenutzer.Passwort = Text.ToString
		Case "Typ"
			mBenutzer.Typ = Text.ToString
		Case "Vorname"
			mBenutzer.Vorname = Text.ToString
	End Select

End Sub

Private Sub gibKundeResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "gibKundeResult"
			' Nichts zu tun
	End Select

End Sub

Private Sub gibLieferantResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "gibLieferantResult"
			' Nichts zu tun
	End Select

End Sub

Private Sub gibMitarbeiterResponseXmlParser_EndElement(Uri As String, Name As String, Text As StringBuilder)

	If mbolVerbose Then
		Log("Es endet: '" & Name & "' mit dem Wert: '" & Text & "'.")
	End If

	Select Name
		Case "gibMitarbeiterResult"
			' Nichts zu tun
	End Select

End Sub

