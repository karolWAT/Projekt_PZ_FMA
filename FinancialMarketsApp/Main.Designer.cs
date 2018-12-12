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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
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
            this.nameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.symbolDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.priceDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.change24hDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.change7dDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cryptocurrenciesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.finMarketsAppDBDataSet = new FinancialMarketsApp.FinMarketsAppDBDataSet();
            this.label2 = new System.Windows.Forms.Label();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.searchButton = new System.Windows.Forms.Button();
            this.contextMenuStrip2 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.searchTextBox = new System.Windows.Forms.TextBox();
            this.currencyLabel = new System.Windows.Forms.Label();
            this.cryptocurrenciesLabel = new System.Windows.Forms.Label();
            this.AddToWalletBtn = new System.Windows.Forms.Button();
            this.RemoveFromWalletBtn = new System.Windows.Forms.Button();
            this.walletDataGridView = new System.Windows.Forms.DataGridView();
            this.nameDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.symbolDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.priceDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.quantityDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sumDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.viewWalletBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.finMarketsAppDBDataSet1 = new FinancialMarketsApp.FinMarketsAppDBDataSet1();
            this.walletNameTextBox = new System.Windows.Forms.TextBox();
            this.walletSymbolTextBox = new System.Windows.Forms.TextBox();
            this.walletPriceTextBox = new System.Windows.Forms.TextBox();
            this.walletQuantityTextBox = new System.Windows.Forms.TextBox();
            this.UpdateWalletBtn = new System.Windows.Forms.Button();
            this.walletNameLabel = new System.Windows.Forms.Label();
            this.walletSymbolLabel = new System.Windows.Forms.Label();
            this.walletPriceLabel = new System.Windows.Forms.Label();
            this.walletQuantityLabel = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.cryptocurrenciesTableAdapter = new FinancialMarketsApp.FinMarketsAppDBDataSetTableAdapters.CryptocurrenciesTableAdapter();
            this.viewWalletTableAdapter = new FinancialMarketsApp.FinMarketsAppDBDataSet1TableAdapters.ViewWalletTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.cryptoDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cryptocurrenciesBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.finMarketsAppDBDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.walletDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.viewWalletBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.finMarketsAppDBDataSet1)).BeginInit();
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
            this.balanceLabel.Location = new System.Drawing.Point(617, 378);
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
            this.balanceValueLabel.Location = new System.Drawing.Point(711, 378);
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
            this.apiButton.Location = new System.Drawing.Point(29, 50);
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
            this.apiNbpButton.Location = new System.Drawing.Point(211, 50);
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
            this.apiProgressBar.Location = new System.Drawing.Point(29, 85);
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
            this.progrssBarlabel.Location = new System.Drawing.Point(155, 82);
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
            this.cryptoApiLabel.Location = new System.Drawing.Point(26, 13);
            this.cryptoApiLabel.Name = "cryptoApiLabel";
            this.cryptoApiLabel.Size = new System.Drawing.Size(76, 18);
            this.cryptoApiLabel.TabIndex = 7;
            this.cryptoApiLabel.Text = "CMC API";
            // 
            // nbpApiLabel
            // 
            this.nbpApiLabel.AutoSize = true;
            this.nbpApiLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.nbpApiLabel.ForeColor = System.Drawing.Color.Gold;
            this.nbpApiLabel.Location = new System.Drawing.Point(208, 13);
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
            this.label1.Location = new System.Drawing.Point(337, 82);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(30, 17);
            this.label1.TabIndex = 10;
            this.label1.Text = "0%";
            // 
            // progressBar1
            // 
            this.progressBar1.ForeColor = System.Drawing.Color.Gold;
            this.progressBar1.Location = new System.Drawing.Point(211, 85);
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
            this.cryptoDataGridView.AllowUserToResizeRows = false;
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
            this.cryptoDataGridView.Location = new System.Drawing.Point(12, 191);
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
            dataGridViewCellStyle9.NullValue = null;
            this.cryptoDataGridView.RowsDefaultCellStyle = dataGridViewCellStyle9;
            this.cryptoDataGridView.RowTemplate.DefaultCellStyle.Format = "N2";
            this.cryptoDataGridView.RowTemplate.DefaultCellStyle.NullValue = null;
            this.cryptoDataGridView.Size = new System.Drawing.Size(361, 154);
            this.cryptoDataGridView.TabIndex = 11;
            this.cryptoDataGridView.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.cryptoDataGridView_CellClick);
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
            dataGridViewCellStyle5.NullValue = null;
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
            // cryptocurrenciesBindingSource
            // 
            this.cryptocurrenciesBindingSource.DataMember = "Cryptocurrencies";
            this.cryptocurrenciesBindingSource.DataSource = this.finMarketsAppDBDataSet;
            // 
            // finMarketsAppDBDataSet
            // 
            this.finMarketsAppDBDataSet.DataSetName = "FinMarketsAppDBDataSet";
            this.finMarketsAppDBDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.label2.ForeColor = System.Drawing.Color.Gold;
            this.label2.Location = new System.Drawing.Point(512, 128);
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
            this.searchButton.Location = new System.Drawing.Point(240, 155);
            this.searchButton.Name = "searchButton";
            this.searchButton.Size = new System.Drawing.Size(69, 24);
            this.searchButton.TabIndex = 15;
            this.searchButton.Text = "Search";
            this.searchButton.UseVisualStyleBackColor = false;
            // 
            // contextMenuStrip2
            // 
            this.contextMenuStrip2.Name = "contextMenuStrip2";
            this.contextMenuStrip2.Size = new System.Drawing.Size(61, 4);
            // 
            // searchTextBox
            // 
            this.searchTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.searchTextBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.searchTextBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.searchTextBox.Location = new System.Drawing.Point(47, 155);
            this.searchTextBox.Name = "searchTextBox";
            this.searchTextBox.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.searchTextBox.Size = new System.Drawing.Size(187, 24);
            this.searchTextBox.TabIndex = 17;
            // 
            // currencyLabel
            // 
            this.currencyLabel.AutoSize = true;
            this.currencyLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.currencyLabel.ForeColor = System.Drawing.Color.Gold;
            this.currencyLabel.Location = new System.Drawing.Point(210, 31);
            this.currencyLabel.Name = "currencyLabel";
            this.currencyLabel.Size = new System.Drawing.Size(56, 13);
            this.currencyLabel.TabIndex = 18;
            this.currencyLabel.Text = "currency";
            // 
            // cryptocurrenciesLabel
            // 
            this.cryptocurrenciesLabel.AutoSize = true;
            this.cryptocurrenciesLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.cryptocurrenciesLabel.ForeColor = System.Drawing.Color.Gold;
            this.cryptocurrenciesLabel.Location = new System.Drawing.Point(27, 31);
            this.cryptocurrenciesLabel.Name = "cryptocurrenciesLabel";
            this.cryptocurrenciesLabel.Size = new System.Drawing.Size(101, 13);
            this.cryptocurrenciesLabel.TabIndex = 19;
            this.cryptocurrenciesLabel.Text = "cryptocurrencies";
            // 
            // AddToWalletBtn
            // 
            this.AddToWalletBtn.BackColor = System.Drawing.Color.LimeGreen;
            this.AddToWalletBtn.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.AddToWalletBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.AddToWalletBtn.Location = new System.Drawing.Point(410, 203);
            this.AddToWalletBtn.Name = "AddToWalletBtn";
            this.AddToWalletBtn.Size = new System.Drawing.Size(74, 24);
            this.AddToWalletBtn.TabIndex = 20;
            this.AddToWalletBtn.Text = "Add";
            this.AddToWalletBtn.UseVisualStyleBackColor = false;
            // 
            // RemoveFromWalletBtn
            // 
            this.RemoveFromWalletBtn.BackColor = System.Drawing.Color.LimeGreen;
            this.RemoveFromWalletBtn.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.RemoveFromWalletBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.RemoveFromWalletBtn.Location = new System.Drawing.Point(691, 203);
            this.RemoveFromWalletBtn.Name = "RemoveFromWalletBtn";
            this.RemoveFromWalletBtn.Size = new System.Drawing.Size(74, 24);
            this.RemoveFromWalletBtn.TabIndex = 21;
            this.RemoveFromWalletBtn.Text = "Remove";
            this.RemoveFromWalletBtn.UseVisualStyleBackColor = false;
            // 
            // walletDataGridView
            // 
            this.walletDataGridView.AllowUserToAddRows = false;
            this.walletDataGridView.AllowUserToDeleteRows = false;
            this.walletDataGridView.AllowUserToResizeRows = false;
            this.walletDataGridView.AutoGenerateColumns = false;
            this.walletDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.walletDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.nameDataGridViewTextBoxColumn1,
            this.symbolDataGridViewTextBoxColumn1,
            this.priceDataGridViewTextBoxColumn1,
            this.quantityDataGridViewTextBoxColumn,
            this.sumDataGridViewTextBoxColumn});
            this.walletDataGridView.DataSource = this.viewWalletBindingSource;
            this.walletDataGridView.Location = new System.Drawing.Point(410, 233);
            this.walletDataGridView.Name = "walletDataGridView";
            this.walletDataGridView.ReadOnly = true;
            this.walletDataGridView.RowHeadersWidth = 24;
            this.walletDataGridView.Size = new System.Drawing.Size(355, 112);
            this.walletDataGridView.TabIndex = 22;
            this.walletDataGridView.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.walletDataGridView_CellClick);
            // 
            // nameDataGridViewTextBoxColumn1
            // 
            this.nameDataGridViewTextBoxColumn1.DataPropertyName = "name";
            this.nameDataGridViewTextBoxColumn1.HeaderText = "name";
            this.nameDataGridViewTextBoxColumn1.Name = "nameDataGridViewTextBoxColumn1";
            this.nameDataGridViewTextBoxColumn1.ReadOnly = true;
            this.nameDataGridViewTextBoxColumn1.Width = 70;
            // 
            // symbolDataGridViewTextBoxColumn1
            // 
            this.symbolDataGridViewTextBoxColumn1.DataPropertyName = "symbol";
            this.symbolDataGridViewTextBoxColumn1.HeaderText = "symbol";
            this.symbolDataGridViewTextBoxColumn1.Name = "symbolDataGridViewTextBoxColumn1";
            this.symbolDataGridViewTextBoxColumn1.ReadOnly = true;
            this.symbolDataGridViewTextBoxColumn1.Width = 55;
            // 
            // priceDataGridViewTextBoxColumn1
            // 
            this.priceDataGridViewTextBoxColumn1.DataPropertyName = "price";
            this.priceDataGridViewTextBoxColumn1.HeaderText = "price";
            this.priceDataGridViewTextBoxColumn1.Name = "priceDataGridViewTextBoxColumn1";
            this.priceDataGridViewTextBoxColumn1.ReadOnly = true;
            this.priceDataGridViewTextBoxColumn1.Width = 70;
            // 
            // quantityDataGridViewTextBoxColumn
            // 
            this.quantityDataGridViewTextBoxColumn.DataPropertyName = "quantity";
            this.quantityDataGridViewTextBoxColumn.HeaderText = "quantity";
            this.quantityDataGridViewTextBoxColumn.Name = "quantityDataGridViewTextBoxColumn";
            this.quantityDataGridViewTextBoxColumn.ReadOnly = true;
            this.quantityDataGridViewTextBoxColumn.Width = 50;
            // 
            // sumDataGridViewTextBoxColumn
            // 
            this.sumDataGridViewTextBoxColumn.DataPropertyName = "sum";
            this.sumDataGridViewTextBoxColumn.HeaderText = "sum";
            this.sumDataGridViewTextBoxColumn.Name = "sumDataGridViewTextBoxColumn";
            this.sumDataGridViewTextBoxColumn.ReadOnly = true;
            this.sumDataGridViewTextBoxColumn.Width = 65;
            // 
            // viewWalletBindingSource
            // 
            this.viewWalletBindingSource.DataMember = "ViewWallet";
            this.viewWalletBindingSource.DataSource = this.finMarketsAppDBDataSet1;
            // 
            // finMarketsAppDBDataSet1
            // 
            this.finMarketsAppDBDataSet1.DataSetName = "FinMarketsAppDBDataSet1";
            this.finMarketsAppDBDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // walletNameTextBox
            // 
            this.walletNameTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.walletNameTextBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.walletNameTextBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.walletNameTextBox.Location = new System.Drawing.Point(410, 173);
            this.walletNameTextBox.Name = "walletNameTextBox";
            this.walletNameTextBox.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.walletNameTextBox.Size = new System.Drawing.Size(76, 23);
            this.walletNameTextBox.TabIndex = 23;
            // 
            // walletSymbolTextBox
            // 
            this.walletSymbolTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.walletSymbolTextBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.walletSymbolTextBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.walletSymbolTextBox.Location = new System.Drawing.Point(490, 173);
            this.walletSymbolTextBox.Name = "walletSymbolTextBox";
            this.walletSymbolTextBox.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.walletSymbolTextBox.Size = new System.Drawing.Size(76, 23);
            this.walletSymbolTextBox.TabIndex = 24;
            // 
            // walletPriceTextBox
            // 
            this.walletPriceTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.walletPriceTextBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.walletPriceTextBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.walletPriceTextBox.Location = new System.Drawing.Point(570, 173);
            this.walletPriceTextBox.Name = "walletPriceTextBox";
            this.walletPriceTextBox.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.walletPriceTextBox.Size = new System.Drawing.Size(76, 23);
            this.walletPriceTextBox.TabIndex = 25;
            // 
            // walletQuantityTextBox
            // 
            this.walletQuantityTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.walletQuantityTextBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.walletQuantityTextBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.walletQuantityTextBox.Location = new System.Drawing.Point(650, 173);
            this.walletQuantityTextBox.Name = "walletQuantityTextBox";
            this.walletQuantityTextBox.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.walletQuantityTextBox.Size = new System.Drawing.Size(76, 23);
            this.walletQuantityTextBox.TabIndex = 26;
            // 
            // UpdateWalletBtn
            // 
            this.UpdateWalletBtn.BackColor = System.Drawing.Color.LimeGreen;
            this.UpdateWalletBtn.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.UpdateWalletBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.UpdateWalletBtn.Location = new System.Drawing.Point(490, 203);
            this.UpdateWalletBtn.Name = "UpdateWalletBtn";
            this.UpdateWalletBtn.Size = new System.Drawing.Size(74, 24);
            this.UpdateWalletBtn.TabIndex = 27;
            this.UpdateWalletBtn.Text = "Update";
            this.UpdateWalletBtn.UseVisualStyleBackColor = false;
            // 
            // walletNameLabel
            // 
            this.walletNameLabel.AutoSize = true;
            this.walletNameLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.walletNameLabel.ForeColor = System.Drawing.Color.Gold;
            this.walletNameLabel.Location = new System.Drawing.Point(427, 157);
            this.walletNameLabel.Name = "walletNameLabel";
            this.walletNameLabel.Size = new System.Drawing.Size(37, 13);
            this.walletNameLabel.TabIndex = 28;
            this.walletNameLabel.Text = "name";
            // 
            // walletSymbolLabel
            // 
            this.walletSymbolLabel.AutoSize = true;
            this.walletSymbolLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.walletSymbolLabel.ForeColor = System.Drawing.Color.Gold;
            this.walletSymbolLabel.Location = new System.Drawing.Point(502, 157);
            this.walletSymbolLabel.Name = "walletSymbolLabel";
            this.walletSymbolLabel.Size = new System.Drawing.Size(45, 13);
            this.walletSymbolLabel.TabIndex = 29;
            this.walletSymbolLabel.Text = "symbol";
            // 
            // walletPriceLabel
            // 
            this.walletPriceLabel.AutoSize = true;
            this.walletPriceLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.walletPriceLabel.ForeColor = System.Drawing.Color.Gold;
            this.walletPriceLabel.Location = new System.Drawing.Point(585, 157);
            this.walletPriceLabel.Name = "walletPriceLabel";
            this.walletPriceLabel.Size = new System.Drawing.Size(35, 13);
            this.walletPriceLabel.TabIndex = 30;
            this.walletPriceLabel.Text = "price";
            // 
            // walletQuantityLabel
            // 
            this.walletQuantityLabel.AutoSize = true;
            this.walletQuantityLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.walletQuantityLabel.ForeColor = System.Drawing.Color.Gold;
            this.walletQuantityLabel.Location = new System.Drawing.Point(663, 157);
            this.walletQuantityLabel.Name = "walletQuantityLabel";
            this.walletQuantityLabel.Size = new System.Drawing.Size(52, 13);
            this.walletQuantityLabel.TabIndex = 31;
            this.walletQuantityLabel.Text = "quantity";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.label3.ForeColor = System.Drawing.Color.Gold;
            this.label3.Location = new System.Drawing.Point(61, 128);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(224, 18);
            this.label3.TabIndex = 32;
            this.label3.Text = "CRYPTOCURRENCIES LIST";
            // 
            // cryptocurrenciesTableAdapter
            // 
            this.cryptocurrenciesTableAdapter.ClearBeforeFill = true;
            // 
            // viewWalletTableAdapter
            // 
            this.viewWalletTableAdapter.ClearBeforeFill = true;
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Desktop;
            this.ClientSize = new System.Drawing.Size(791, 405);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.walletQuantityLabel);
            this.Controls.Add(this.walletPriceLabel);
            this.Controls.Add(this.walletSymbolLabel);
            this.Controls.Add(this.walletNameLabel);
            this.Controls.Add(this.UpdateWalletBtn);
            this.Controls.Add(this.walletQuantityTextBox);
            this.Controls.Add(this.walletPriceTextBox);
            this.Controls.Add(this.walletSymbolTextBox);
            this.Controls.Add(this.walletNameTextBox);
            this.Controls.Add(this.walletDataGridView);
            this.Controls.Add(this.RemoveFromWalletBtn);
            this.Controls.Add(this.AddToWalletBtn);
            this.Controls.Add(this.cryptocurrenciesLabel);
            this.Controls.Add(this.currencyLabel);
            this.Controls.Add(this.searchTextBox);
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
            ((System.ComponentModel.ISupportInitialize)(this.cryptocurrenciesBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.finMarketsAppDBDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.walletDataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.viewWalletBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.finMarketsAppDBDataSet1)).EndInit();
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
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.Button searchButton;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip2;
        private System.Windows.Forms.TextBox searchTextBox;
        private System.Windows.Forms.Label currencyLabel;
        private System.Windows.Forms.Label cryptocurrenciesLabel;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn symbolDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn priceDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn change24hDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn change7dDataGridViewTextBoxColumn;
        private System.Windows.Forms.Button AddToWalletBtn;
        private System.Windows.Forms.Button RemoveFromWalletBtn;
        private System.Windows.Forms.DataGridView walletDataGridView;
        private System.Windows.Forms.TextBox walletNameTextBox;
        private System.Windows.Forms.TextBox walletSymbolTextBox;
        private System.Windows.Forms.TextBox walletPriceTextBox;
        private System.Windows.Forms.TextBox walletQuantityTextBox;
        private System.Windows.Forms.Button UpdateWalletBtn;
        private System.Windows.Forms.Label walletNameLabel;
        private System.Windows.Forms.Label walletSymbolLabel;
        private System.Windows.Forms.Label walletPriceLabel;
        private System.Windows.Forms.Label walletQuantityLabel;
        private System.Windows.Forms.Label label3;
        private FinMarketsAppDBDataSet1 finMarketsAppDBDataSet1;
        private System.Windows.Forms.BindingSource viewWalletBindingSource;
        private FinMarketsAppDBDataSet1TableAdapters.ViewWalletTableAdapter viewWalletTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn symbolDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn priceDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn quantityDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn sumDataGridViewTextBoxColumn;
    }
}