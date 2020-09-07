namespace sporimport
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.btFjern = new System.Windows.Forms.Button();
            this.btIndsaet = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.lbFiler = new System.Windows.Forms.ListBox();
            this.btNulstil = new System.Windows.Forms.Button();
            this.btImport = new System.Windows.Forms.Button();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.cbDatabase = new System.Windows.Forms.ComboBox();
            this.btAfslut = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.tbLog = new System.Windows.Forms.TextBox();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.tableLayoutPanel1.SuspendLayout();
            this.tableLayoutPanel2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 1;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.Controls.Add(this.tableLayoutPanel2, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.groupBox4, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.btAfslut, 3, 3);
            this.tableLayoutPanel1.Controls.Add(this.groupBox2, 0, 2);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Margin = new System.Windows.Forms.Padding(2);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 1;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 63.46423F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 64F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 36.53577F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 51F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 13F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(636, 662);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.ColumnCount = 2;
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 80F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel2.Controls.Add(this.btFjern, 2, 1);
            this.tableLayoutPanel2.Controls.Add(this.btIndsaet, 2, 0);
            this.tableLayoutPanel2.Controls.Add(this.groupBox3, 0, 0);
            this.tableLayoutPanel2.Controls.Add(this.btNulstil, 1, 2);
            this.tableLayoutPanel2.Controls.Add(this.btImport, 1, 4);
            this.tableLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel2.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel2.Margin = new System.Windows.Forms.Padding(0);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.Padding = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.tableLayoutPanel2.RowCount = 5;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 51F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 51F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 51F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 51F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(636, 347);
            this.tableLayoutPanel2.TabIndex = 5;
            // 
            // btFjern
            // 
            this.btFjern.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btFjern.Location = new System.Drawing.Point(511, 63);
            this.btFjern.Margin = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.btFjern.Name = "btFjern";
            this.btFjern.Padding = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.btFjern.Size = new System.Drawing.Size(111, 39);
            this.btFjern.TabIndex = 4;
            this.btFjern.Text = "Fjern fil(er)";
            this.btFjern.UseVisualStyleBackColor = true;
            this.btFjern.Click += new System.EventHandler(this.btFjern_Click);
            // 
            // btIndsaet
            // 
            this.btIndsaet.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btIndsaet.Location = new System.Drawing.Point(511, 12);
            this.btIndsaet.Margin = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.btIndsaet.Name = "btIndsaet";
            this.btIndsaet.Padding = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.btIndsaet.Size = new System.Drawing.Size(111, 39);
            this.btIndsaet.TabIndex = 3;
            this.btIndsaet.Text = "Indsæt fil(er)";
            this.btIndsaet.UseVisualStyleBackColor = true;
            this.btIndsaet.Click += new System.EventHandler(this.btIndsaet_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.lbFiler);
            this.groupBox3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox3.Location = new System.Drawing.Point(7, 6);
            this.groupBox3.Margin = new System.Windows.Forms.Padding(0);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Padding = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.tableLayoutPanel2.SetRowSpan(this.groupBox3, 5);
            this.groupBox3.Size = new System.Drawing.Size(497, 335);
            this.groupBox3.TabIndex = 5;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Filer til indlæsning";
            // 
            // lbFiler
            // 
            this.lbFiler.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lbFiler.FormattingEnabled = true;
            this.lbFiler.ItemHeight = 16;
            this.lbFiler.Location = new System.Drawing.Point(7, 21);
            this.lbFiler.Margin = new System.Windows.Forms.Padding(2);
            this.lbFiler.Name = "lbFiler";
            this.lbFiler.SelectionMode = System.Windows.Forms.SelectionMode.MultiExtended;
            this.lbFiler.Size = new System.Drawing.Size(483, 308);
            this.lbFiler.TabIndex = 1;
            // 
            // btNulstil
            // 
            this.btNulstil.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btNulstil.Location = new System.Drawing.Point(511, 114);
            this.btNulstil.Margin = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.btNulstil.Name = "btNulstil";
            this.btNulstil.Padding = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.btNulstil.Size = new System.Drawing.Size(111, 39);
            this.btNulstil.TabIndex = 6;
            this.btNulstil.Text = "Nulstil";
            this.btNulstil.UseVisualStyleBackColor = true;
            this.btNulstil.Click += new System.EventHandler(this.btNulstil_Click);
            // 
            // btImport
            // 
            this.btImport.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btImport.Location = new System.Drawing.Point(511, 296);
            this.btImport.Margin = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.btImport.Name = "btImport";
            this.btImport.Padding = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.btImport.Size = new System.Drawing.Size(111, 39);
            this.btImport.TabIndex = 7;
            this.btImport.Text = "Indlæs i DB";
            this.btImport.UseVisualStyleBackColor = true;
            this.btImport.Click += new System.EventHandler(this.btImport_Click);
            // 
            // groupBox4
            // 
            this.groupBox4.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox4.AutoSize = true;
            this.groupBox4.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.tableLayoutPanel1.SetColumnSpan(this.groupBox4, 4);
            this.groupBox4.Controls.Add(this.cbDatabase);
            this.groupBox4.Location = new System.Drawing.Point(7, 353);
            this.groupBox4.Margin = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Padding = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.groupBox4.Size = new System.Drawing.Size(622, 52);
            this.groupBox4.TabIndex = 4;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Profil valg";
            // 
            // cbDatabase
            // 
            this.cbDatabase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cbDatabase.FormattingEnabled = true;
            this.cbDatabase.Location = new System.Drawing.Point(7, 21);
            this.cbDatabase.Margin = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.cbDatabase.Name = "cbDatabase";
            this.cbDatabase.Size = new System.Drawing.Size(608, 24);
            this.cbDatabase.TabIndex = 0;
            // 
            // btAfslut
            // 
            this.btAfslut.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.btAfslut.DialogResult = System.Windows.Forms.DialogResult.Abort;
            this.btAfslut.Location = new System.Drawing.Point(7, 616);
            this.btAfslut.Margin = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.btAfslut.Name = "btAfslut";
            this.btAfslut.Padding = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.btAfslut.Size = new System.Drawing.Size(622, 40);
            this.btAfslut.TabIndex = 2;
            this.btAfslut.Text = "Afslut";
            this.btAfslut.UseVisualStyleBackColor = true;
            this.btAfslut.Click += new System.EventHandler(this.btAfslut_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox2.AutoSize = true;
            this.groupBox2.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.tableLayoutPanel1.SetColumnSpan(this.groupBox2, 4);
            this.groupBox2.Controls.Add(this.tbLog);
            this.groupBox2.Location = new System.Drawing.Point(7, 417);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(7, 6, 7, 6);
            this.groupBox2.Size = new System.Drawing.Size(622, 187);
            this.groupBox2.TabIndex = 3;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Log";
            // 
            // tbLog
            // 
            this.tbLog.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tbLog.Location = new System.Drawing.Point(7, 21);
            this.tbLog.Margin = new System.Windows.Forms.Padding(2);
            this.tbLog.Multiline = true;
            this.tbLog.Name = "tbLog";
            this.tbLog.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.tbLog.Size = new System.Drawing.Size(608, 160);
            this.tbLog.TabIndex = 0;
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(636, 662);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "Form1";
            this.Text = "Import af GNSS-data";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.tableLayoutPanel2.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ComboBox cbDatabase;
        private System.Windows.Forms.TextBox tbLog;
        private System.Windows.Forms.Button btAfslut;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Button btFjern;
        private System.Windows.Forms.Button btIndsaet;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.ListBox lbFiler;
        private System.Windows.Forms.Button btNulstil;
        private System.Windows.Forms.Button btImport;

    }
}

