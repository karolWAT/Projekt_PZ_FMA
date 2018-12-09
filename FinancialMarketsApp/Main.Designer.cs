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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Main));
            this.logOutButton = new System.Windows.Forms.Button();
            this.balanceLabel = new System.Windows.Forms.Label();
            this.balanceValueLabel = new System.Windows.Forms.Label();
            this.apiButton = new System.Windows.Forms.Button();
            this.apiNbpButton = new System.Windows.Forms.Button();
            this.apiProgressBar = new System.Windows.Forms.ProgressBar();
            this.SuspendLayout();
            // 
            // logOutButton
            // 
            this.logOutButton.BackColor = System.Drawing.Color.Gold;
            this.logOutButton.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.logOutButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.logOutButton.Location = new System.Drawing.Point(645, 12);
            this.logOutButton.Name = "logOutButton";
            this.logOutButton.Size = new System.Drawing.Size(75, 29);
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
            this.balanceLabel.Location = new System.Drawing.Point(543, 304);
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
            this.balanceValueLabel.Location = new System.Drawing.Point(637, 304);
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
            this.apiButton.Location = new System.Drawing.Point(42, 12);
            this.apiButton.Name = "apiButton";
            this.apiButton.Size = new System.Drawing.Size(75, 29);
            this.apiButton.TabIndex = 3;
            this.apiButton.Text = "API";
            this.apiButton.UseVisualStyleBackColor = false;
            this.apiButton.Click += new System.EventHandler(this.apiButton_Click);
            // 
            // apiNbpButton
            // 
            this.apiNbpButton.BackColor = System.Drawing.Color.Gold;
            this.apiNbpButton.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.apiNbpButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.apiNbpButton.Location = new System.Drawing.Point(136, 12);
            this.apiNbpButton.Name = "apiNbpButton";
            this.apiNbpButton.Size = new System.Drawing.Size(79, 29);
            this.apiNbpButton.TabIndex = 4;
            this.apiNbpButton.Text = "API NBP";
            this.apiNbpButton.UseVisualStyleBackColor = false;
            this.apiNbpButton.Click += new System.EventHandler(this.apiNbpButton_Click);
            // 
            // apiProgressBar
            // 
            this.apiProgressBar.ForeColor = System.Drawing.Color.Gold;
            this.apiProgressBar.Location = new System.Drawing.Point(42, 59);
            this.apiProgressBar.Name = "apiProgressBar";
            this.apiProgressBar.Size = new System.Drawing.Size(173, 19);
            this.apiProgressBar.Step = 1;
            this.apiProgressBar.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.apiProgressBar.TabIndex = 5;
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Desktop;
            this.ClientSize = new System.Drawing.Size(735, 347);
            this.Controls.Add(this.apiProgressBar);
            this.Controls.Add(this.apiNbpButton);
            this.Controls.Add(this.apiButton);
            this.Controls.Add(this.balanceValueLabel);
            this.Controls.Add(this.balanceLabel);
            this.Controls.Add(this.logOutButton);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Main";
            this.Text = "Financial Markets App";
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
    }
}