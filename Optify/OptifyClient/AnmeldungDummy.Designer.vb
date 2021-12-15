<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class AnmeldungDummy
    Inherits System.Windows.Forms.Form

    'Das Formular überschreibt den Löschvorgang, um die Komponentenliste zu bereinigen.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Wird vom Windows Form-Designer benötigt.
    Private components As System.ComponentModel.IContainer

    'Hinweis: Die folgende Prozedur ist für den Windows Form-Designer erforderlich.
    'Das Bearbeiten ist mit dem Windows Form-Designer möglich.  
    'Das Bearbeiten mit dem Code-Editor ist nicht möglich.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.btnAnmelden = New System.Windows.Forms.Button()
        Me.txtBenutzername = New System.Windows.Forms.TextBox()
        Me.txtPasswort = New System.Windows.Forms.TextBox()
        Me.lblBenutzername = New System.Windows.Forms.Label()
        Me.lblPasswort = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'btnAnmelden
        '
        Me.btnAnmelden.Location = New System.Drawing.Point(909, 361)
        Me.btnAnmelden.Name = "btnAnmelden"
        Me.btnAnmelden.Size = New System.Drawing.Size(153, 58)
        Me.btnAnmelden.TabIndex = 0
        Me.btnAnmelden.Text = "Anmelden"
        Me.btnAnmelden.UseVisualStyleBackColor = True
        '
        'txtBenutzername
        '
        Me.txtBenutzername.Location = New System.Drawing.Point(446, 212)
        Me.txtBenutzername.Name = "txtBenutzername"
        Me.txtBenutzername.Size = New System.Drawing.Size(616, 31)
        Me.txtBenutzername.TabIndex = 1
        '
        'txtPasswort
        '
        Me.txtPasswort.Location = New System.Drawing.Point(446, 276)
        Me.txtPasswort.Name = "txtPasswort"
        Me.txtPasswort.Size = New System.Drawing.Size(616, 31)
        Me.txtPasswort.TabIndex = 2
        '
        'lblBenutzername
        '
        Me.lblBenutzername.AutoSize = True
        Me.lblBenutzername.Location = New System.Drawing.Point(224, 218)
        Me.lblBenutzername.Name = "lblBenutzername"
        Me.lblBenutzername.Size = New System.Drawing.Size(151, 25)
        Me.lblBenutzername.TabIndex = 3
        Me.lblBenutzername.Text = "Benutzername"
        '
        'lblPasswort
        '
        Me.lblPasswort.AutoSize = True
        Me.lblPasswort.Location = New System.Drawing.Point(224, 279)
        Me.lblPasswort.Name = "lblPasswort"
        Me.lblPasswort.Size = New System.Drawing.Size(100, 25)
        Me.lblPasswort.TabIndex = 4
        Me.lblPasswort.Text = "Passwort"
        '
        'AnmeldungDummy
        '
        Me.AcceptButton = Me.btnAnmelden
        Me.AutoScaleDimensions = New System.Drawing.SizeF(12.0!, 25.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1242, 761)
        Me.Controls.Add(Me.lblPasswort)
        Me.Controls.Add(Me.lblBenutzername)
        Me.Controls.Add(Me.txtPasswort)
        Me.Controls.Add(Me.txtBenutzername)
        Me.Controls.Add(Me.btnAnmelden)
        Me.Name = "AnmeldungDummy"
        Me.Text = "AnmeldungDummy"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents btnAnmelden As Button
    Friend WithEvents txtBenutzername As TextBox
    Friend WithEvents txtPasswort As TextBox
    Friend WithEvents lblBenutzername As Label
    Friend WithEvents lblPasswort As Label
End Class
