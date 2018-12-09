namespace FinancialMarketsApp
{
    partial class Main
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
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Main));
            this.logOutButton = new System.Windows.Forms.Button();
            this.balanceLabel = new System.Windows.Forms.Label();
            this.balanceValueLabel = new System.Windows.Forms.Label();
            this.apiButton = new System.Windows.Forms.Button();
            this.apiNbpButton = new System.Windows.Forms.Button();
            this.apiProgressBar = new System.Windows.Forms.ProgressBar();
            this.progrssBarlabel = new System.Windows.Forms.Label();
            this.cryptoApiLabel = new System.Windows.Forms.Label();
            this.nbpApiLabel = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.cryptoDataGridView = new System.Windows.Forms.DataGridView();
            this.finMarketsAppDBDataSet = new FinancialMarketsApp.FinMarketsAppDBDataSet();
            this.cryptocurrenciesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cryptocurrenciesTableAdapter = new FinancialMarketsApp.FinMarketsAppDBDataSetTableAdapters.CryptocurrenciesTableAdapter();
            this.nameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.symbolDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.priceDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.change24hDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.change7dDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label2 = new System.Windows.Forms.Label();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.searchButton = new System.Windows.Forms.Button();
            this.passTextBox = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.cryptoDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.finMarketsAppDBDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cryptocurrenciesBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // logOutButton
            // 
            this.logOutButton.BackColor = System.Drawing.Color.Gold;
            this.logOutButton.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.logOutButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.logOutButton.Location = new System.Drawing.Point(704, 5);
            this.logOutButton.Name = "logOutButton";
            this.logOutButton.Size = new System.Drawing.Size(74, 26);
            this.logOutButton.TabIndex = 0;
            this.logOutButton.Text = "Log out";
            this.logOutButton.UseVisualStyleBackColor = false;
            this.logOutButton.Click += new System.EventHandler(this.logOutButton_Click);
            // 
            // balanceLabel
            // 
            this.balanceLabel.AutoSize = true;
            this.balanceLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.balanceLabel.ForeColor = System.Drawing.Color.Gold;
            this.balanceLabel.Location = new System.Drawing.Point(631, 366);
            this.balanceLabel.Name = "balanceLabel";
            this.balanceLabel.Size = new System.Drawing.Size(88, 18);
            this.balanceLabel.TabIndex = 1;
            this.balanceLabel.Text = "BALANCE:";
            // 
            // balanceValueLabel
            // 
            this.balanceValueLabel.AutoSize = true;
            this.balanceValueLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.balanceValueLabel.ForeColor = System.Drawing.Color.Gold;
            this.balanceValueLabel.Location = new System.Drawing.Point(725, 366);
            this.balanceValueLabel.Name = "balanceValueLabel";
            this.balanceValueLabel.Size = new System.Drawing.Size(54, 18);
            this.balanceValueLabel.TabIndex = 2;
            this.balanceValueLabel.Text = "0,00 $";
            // 
            // apiButton
            // 
            this.apiButton.BackColor = System.Drawing.Color.Gold;
            this.apiButton.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.apiButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.apiButton.Location = new System.Drawing.Point(29, 42);
            this.apiButton.Name = "apiButton";
            this.apiButton.Size = new System.Drawing.Size(74, 24);
            this.apiButton.TabIndex = 3;
            this.apiButton.Text = "Refresh";
            this.apiButton.UseVisualStyleBackColor = false;
            this.apiButton.Click += new System.EventHandler(this.apiButton_Click);
            // 
            // apiNbpButton
            // 
            this.apiNbpButton.BackColor = System.Drawing.Color.Gold;
            this.apiNbpButton.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.apiNbpButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.apiNbpButton.Location = new System.Drawing.Point(211, 42);
            this.apiNbpButton.Name = "apiNbpButton";
            this.apiNbpButton.Size = new System.Drawing.Size(74, 24);
            this.apiNbpButton.TabIndex = 4;
            this.apiNbpButton.Text = "Refresh";
            this.apiNbpButton.UseVisualStyleBackColor = false;
            this.apiNbpButton.Click += new System.EventHandler(this.apiNbpButton_Click);
            // 
            // apiProgressBar
            // 
            this.apiProgressBar.ForeColor = System.Drawing.Color.Gold;
            this.apiProgressBar.Location = new System.Drawing.Point(29, 77);
            this.apiProgressBar.Name = "apiProgressBar";
            this.apiProgressBar.Size = new System.Drawing.Size(120, 14);
            this.apiProgressBar.Step = 1;
            this.apiProgressBar.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.apiProgressBar.TabIndex = 5;
            // 
            // progrssBarlabel
            // 
            this.progrssBarlabel.AutoSize = true;
            this.progrssBarlabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.progrssBarlabel.ForeColor = System.Drawing.Color.Gold;
            this.progrssBarlabel.Location = new System.Drawing.Point(155, 74);
            this.progrssBarlabel.Name = "progrssBarlabel";
            this.progrssBarlabel.Size = new System.Drawing.Size(30, 17);
            this.progrssBarlabel.TabIndex = 6;
            this.progrssBarlabel.Text = "0%";
            // 
            // cryptoApiLabel
            // 
            this.cryptoApiLabel.AutoSize = true;
            this.cryptoApiLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.cryptoApiLabel.ForeColor = System.Drawing.Color.Gold;
            this.cryptoApiLabel.Location = new System.Drawing.Point(26, 16);
            this.cryptoApiLabel.Name = "cryptoApiLabel";
            this.cryptoApiLabel.Size = new System.Drawing.Size(106, 18);
            this.cryptoApiLabel.TabIndex = 7;
            this.cryptoApiLabel.Text = "CRYPTO API";
            // 
            // nbpApiLabel
            // 
            this.nbpApiLabel.AutoSize = true;
            this.nbpApiLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.nbpApiLabel.ForeColor = System.Drawing.Color.Gold;
            this.nbpApiLabel.Location = new System.Drawing.Point(208, 16);
            this.nbpApiLabel.Name = "nbpApiLabel";
            this.nbpApiLabel.Size = new System.Drawing.Size(72, 18);
            this.nbpApiLabel.TabIndex = 8;
            this.nbpApiLabel.Text = "NBP API";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.label1.ForeColor = System.Drawing.Color.Gold;
            this.label1.Location = new System.Drawing.Point(337, 73);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(30, 17);
            this.label1.TabIndex = 10;
            this.label1.Text = "0%";
            // 
            // progressBar1
            // 
            this.progressBar1.ForeColor = System.Drawing.Color.Gold;
            this.progressBar1.Location = new System.Drawing.Point(211, 76);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(120, 14);
            this.progressBar1.Step = 1;
            this.progressBar1.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.progressBar1.TabIndex = 9;
            // 
            // cryptoDataGridView
            // 
            this.cryptoDataGridView.AllowUserToAddRows = false;
            this.cryptoDataGridView.AllowUserToDeleteRows = false;
            dataGridViewCellStyle1.Format = "C2";
            dataGridViewCellStyle1.NullValue = null;
            this.cryptoDataGridView.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.cryptoDataGridView.AutoGenerateColumns = false;
            this.cryptoDataGridView.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.cryptoDataGridView.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.cryptoDataGridView.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.Raised;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.cryptoDataGridView.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.cryptoDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.cryptoDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.nameDataGridViewTextBoxColumn,
            this.symbolDataGridViewTextBoxColumn,
            this.priceDataGridViewTextBoxColumn,
            this.change24hDataGridViewTextBoxColumn,
            this.change7dDataGridViewTextBoxColumn});
            this.cryptoDataGridView.DataSource = this.cryptocurrenciesBindingSource;
            this.cryptoDataGridView.Location = new System.Drawing.Point(12, 160);
            this.cryptoDataGridView.Name = "cryptoDataGridView";
            this.cryptoDataGridView.ReadOnly = true;
            this.cryptoDataGridView.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Single;
            dataGridViewCellStyle8.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle8.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            dataGridViewCellStyle8.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle8.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle8.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle8.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.cryptoDataGridView.RowHeadersDefaultCellStyle = dataGridViewCellStyle8;
            this.cryptoDataGridView.RowHeadersWidth = 23;
            this.cryptoDataGridView.RowTemplate.DefaultCellStyle.Format = "C2";
            this.cryptoDataGridView.RowTemplate.DefaultCellStyle.NullValue = null;
            this.cryptoDataGridView.Size = new System.Drawing.Size(360, 154);
            this.cryptoDataGridView.TabIndex = 11;
            this.cryptoDataGridView.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.cryptoDataGridView_CellContentClick);
            // 
            // finMarketsAppDBDataSet
            // 
            this.finMarketsAppDBDataSet.DataSetName = "FinMarketsAppDBDataSet";
            this.finMarketsAppDBDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // cryptocurrenciesBindingSource
            // 
            this.cryptocurrenciesBindingSource.DataMember = "Cryptocurrencies";
            this.cryptocurrenciesBindingSource.DataSource = this.finMarketsAppDBDataSet;
            // 
            // cryptocurrenciesTableAdapter
            // 
            this.cryptocurrenciesTableAdapter.ClearBeforeFill = true;
            // 
            // nameDataGridViewTextBoxColumn
            // 
            this.nameDataGridViewTextBoxColumn.DataPropertyName = "name";
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            this.nameDataGridViewTextBoxColumn.DefaultCellStyle = dataGridViewCellStyle3;
            this.nameDataGridViewTextBoxColumn.HeaderText = "name";
            this.nameDataGridViewTextBoxColumn.Name = "nameDataGridViewTextBoxColumn";
            this.nameDataGridViewTextBoxColumn.ReadOnly = true;
            this.nameDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.nameDataGridViewTextBoxColumn.Width = 79;
            // 
            // symbolDataGridViewTextBoxColumn
            // 
            this.symbolDataGridViewTextBoxColumn.DataPropertyName = "symbol";
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.symbolDataGridViewTextBoxColumn.DefaultCellStyle = dataGridViewCellStyle4;
            this.symbolDataGridViewTextBoxColumn.HeaderText = "symbol";
            this.symbolDataGridViewTextBoxColumn.Name = "symbolDataGridViewTextBoxColumn";
            this.symbolDataGridViewTextBoxColumn.ReadOnly = true;
            this.symbolDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.symbolDataGridViewTextBoxColumn.Width = 42;
            // 
            // priceDataGridViewTextBoxColumn
            // 
            this.priceDataGridViewTextBoxColumn.DataPropertyName = "price";
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.priceDataGridViewTextBoxColumn.DefaultCellStyle = dataGridViewCellStyle5;
            this.priceDataGridViewTextBoxColumn.HeaderText = "price";
            this.priceDataGridViewTextBoxColumn.Name = "priceDataGridViewTextBoxColumn";
            this.priceDataGridViewTextBoxColumn.ReadOnly = true;
            this.priceDataGridViewTextBoxColumn.Width = 74;
            // 
            // change24hDataGridViewTextBoxColumn
            // 
            this.change24hDataGridViewTextBoxColumn.DataPropertyName = "change24h";
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.change24hDataGridViewTextBoxColumn.DefaultCellStyle = dataGridViewCellStyle6;
            this.change24hDataGridViewTextBoxColumn.HeaderText = "change24h";
            this.change24hDataGridViewTextBoxColumn.Name = "change24hDataGridViewTextBoxColumn";
            this.change24hDataGridViewTextBoxColumn.ReadOnly = true;
            this.change24hDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.change24hDataGridViewTextBoxColumn.Width = 65;
            // 
            // change7dDataGridViewTextBoxColumn
            // 
            this.change7dDataGridViewTextBoxColumn.DataPropertyName = "change7d";
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.change7dDataGridViewTextBoxColumn.DefaultCellStyle = dataGridViewCellStyle7;
            this.change7dDataGridViewTextBoxColumn.HeaderText = "change7d";
            this.change7dDataGridViewTextBoxColumn.Name = "change7dDataGridViewTextBoxColumn";
            this.change7dDataGridViewTextBoxColumn.ReadOnly = true;
            this.change7dDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.change7dDataGridViewTextBoxColumn.Width = 58;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.label2.ForeColor = System.Drawing.Color.Gold;
            this.label2.Location = new System.Drawing.Point(446, 71);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(73, 18);
            this.label2.TabIndex = 12;
            this.label2.Text = "WALLET";
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // searchButton
            // 
            this.searchButton.BackColor = System.Drawing.Color.Gold;
            this.searchButton.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.searchButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.searchButton.Location = new System.Drawing.Point(200, 130);
            this.searchButton.Name = "searchButton";
            this.searchButton.Size = new System.Drawing.Size(69, 24);
            this.searchButton.TabIndex = 15;
            this.searchButton.Text = "Search";
            this.searchButton.UseVisualStyleBackColor = false;
            // 
            // passTextBox
            // 
            this.passTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.passTextBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.passTextBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.passTextBox.Location = new System.Drawing.Point(25, 130);
            this.passTextBox.Multiline = true;
            this.passTextBox.Name = "passTextBox";
            this.passTextBox.PasswordChar = '*';
            this.passTextBox.Size = new System.Drawing.Size(160, 24);
            this.passTextBox.TabIndex = 16;
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Desktop;
            this.ClientSize = new System.Drawing.Size(791, 393);
            this.Controls.Add(this.passTextBox);
            this.Controls.Add(this.searchButton);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cryptoDataGridView);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.nbpApiLabel);
            this.Controls.Add(this.cryptoApiLabel);
            this.Controls.Add(this.progrssBarlabel);
            this.Controls.Add(this.apiProgressBar);
            this.Controls.Add(this.apiNbpButton);
            this.Controls.Add(this.apiButton);
            this.Controls.Add(this.balanceValueLabel);
            this.Controls.Add(this.balanceLabel);
            this.Controls.Add(this.logOutButton);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Main";
            this.Text = "Financial Markets App";
            this.Load += new System.EventHandler(this.Main_Load);
            ((System.ComponentModel.ISupportInitialize)(this.cryptoDataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.finMarketsAppDBDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cryptocurrenciesBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button logOutButton;
        private System.Windows.Forms.Label balanceLabel;
        private System.Windows.Forms.Label balanceValueLabel;
        private System.Windows.Forms.Button apiButton;
        private System.Windows.Forms.Button apiNbpButton;
        private System.Windows.Forms.ProgressBar apiProgressBar;
        private System.Windows.Forms.Label progrssBarlabel;
        private System.Windows.Forms.Label cryptoApiLabel;
        private System.Windows.Forms.Label nbpApiLabel;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.DataGridView cryptoDataGridView;
        private FinMarketsAppDBDataSet finMarketsAppDBDataSet;
        private System.Windows.Forms.BindingSource cryptocurrenciesBindingSource;
        private FinMarketsAppDBDataSetTableAdapters.CryptocurrenciesTableAdapter cryptocurrenciesTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn symbolDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn priceDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn change24hDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn change7dDataGridViewTextBoxColumn;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.Button searchButton;
        private System.Windows.Forms.TextBox passTextBox;
    }
}