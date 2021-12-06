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
        Me.SuspendLayout()
        '
        'btnAnmelden
        '
        Me.btnAnmelden.Location = New System.Drawing.Point(1001, 691)
        Me.btnAnmelden.Name = "btnAnmelden"
        Me.btnAnmelden.Size = New System.Drawing.Size(153, 58)
        Me.btnAnmelden.TabIndex = 0
        Me.btnAnmelden.Text = "Anmelden"
        Me.btnAnmelden.UseVisualStyleBackColor = True
        '
        'txtBenutzername
        '
        Me.txtBenutzername.Location = New System.Drawing.Point(170, 206)
        Me.txtBenutzername.Name = "txtBenutzername"
        Me.txtBenutzername.Size = New System.Drawing.Size(616, 31)
        Me.txtBenutzername.TabIndex = 1
        '
        'txtPasswort
        '
        Me.txtPasswort.Location = New System.Drawing.Point(170, 280)
        Me.txtPasswort.Name = "txtPasswort"
        Me.txtPasswort.Size = New System.Drawing.Size(623, 31)
        Me.txtPasswort.TabIndex = 2
        '
        'AnmeldungDummy
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(12.0!, 25.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1242, 761)
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
End Class
