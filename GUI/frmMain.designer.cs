namespace KaraokeICOOL
{
    partial class frmMain
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
            this.sbtn_Dashboard = new System.Windows.Forms.ToolStripButton();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.sbtn_ThanhToanHD = new System.Windows.Forms.ToolStripButton();
            this.toolStrip3 = new System.Windows.Forms.ToolStrip();
            this.sbtn_DangXuat = new System.Windows.Forms.ToolStripButton();
            this.lb_CurrentUserName = new System.Windows.Forms.ToolStripLabel();
            this.toolStrip1.SuspendLayout();
            this.toolStrip3.SuspendLayout();
            this.SuspendLayout();
            // 
            // sbtn_Dashboard
            // 
            this.sbtn_Dashboard.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sbtn_Dashboard.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(187)))), ((int)(((byte)(54)))), ((int)(((byte)(137)))));
            this.sbtn_Dashboard.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.sbtn_Dashboard.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.sbtn_Dashboard.Name = "sbtn_Dashboard";
            this.sbtn_Dashboard.Size = new System.Drawing.Size(86, 32);
            this.sbtn_Dashboard.Text = "Dashboard";
            // 
            // toolStrip1
            // 
            this.toolStrip1.AutoSize = false;
            this.toolStrip1.BackColor = System.Drawing.SystemColors.Control;
            this.toolStrip1.Font = new System.Drawing.Font("Segoe UI", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.toolStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.sbtn_Dashboard,
            this.sbtn_ThanhToanHD});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(1920, 35);
            this.toolStrip1.TabIndex = 41;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // sbtn_ThanhToanHD
            // 
            this.sbtn_ThanhToanHD.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sbtn_ThanhToanHD.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(187)))), ((int)(((byte)(54)))), ((int)(((byte)(137)))));
            this.sbtn_ThanhToanHD.Image = global::KaraokeICOOL.Properties.Resources.payment;
            this.sbtn_ThanhToanHD.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.sbtn_ThanhToanHD.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.sbtn_ThanhToanHD.Name = "sbtn_ThanhToanHD";
            this.sbtn_ThanhToanHD.Size = new System.Drawing.Size(93, 32);
            this.sbtn_ThanhToanHD.Text = "Hóa Đơn";
            this.sbtn_ThanhToanHD.Click += new System.EventHandler(this.sbtn_ThanhToanHD_Click);
            // 
            // toolStrip3
            // 
            this.toolStrip3.AutoSize = false;
            this.toolStrip3.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.toolStrip3.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.toolStrip3.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.sbtn_DangXuat,
            this.lb_CurrentUserName});
            this.toolStrip3.Location = new System.Drawing.Point(0, 1014);
            this.toolStrip3.Name = "toolStrip3";
            this.toolStrip3.Size = new System.Drawing.Size(1920, 37);
            this.toolStrip3.TabIndex = 43;
            this.toolStrip3.Text = "toolStrip3";
            // 
            // sbtn_DangXuat
            // 
            this.sbtn_DangXuat.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sbtn_DangXuat.ForeColor = System.Drawing.SystemColors.ControlText;
            this.sbtn_DangXuat.Image = global::KaraokeICOOL.Properties.Resources.logout;
            this.sbtn_DangXuat.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.sbtn_DangXuat.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.sbtn_DangXuat.Name = "sbtn_DangXuat";
            this.sbtn_DangXuat.Size = new System.Drawing.Size(128, 34);
            this.sbtn_DangXuat.Text = "Đăng Xuất";
            this.sbtn_DangXuat.Click += new System.EventHandler(this.sbtn_DangXuat_Click);
            // 
            // lb_CurrentUserName
            // 
            this.lb_CurrentUserName.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right;
            this.lb_CurrentUserName.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_CurrentUserName.ForeColor = System.Drawing.Color.Red;
            this.lb_CurrentUserName.Image = global::KaraokeICOOL.Properties.Resources.admin;
            this.lb_CurrentUserName.Name = "lb_CurrentUserName";
            this.lb_CurrentUserName.Size = new System.Drawing.Size(20, 34);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlDark;
            this.ClientSize = new System.Drawing.Size(1920, 1051);
            this.Controls.Add(this.toolStrip3);
            this.Controls.Add(this.toolStrip1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "frmMain";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.toolStrip3.ResumeLayout(false);
            this.toolStrip3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.ToolStripButton sbtn_Dashboard;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton sbtn_ThanhToanHD;
        private System.Windows.Forms.ToolStrip toolStrip3;
        private System.Windows.Forms.ToolStripButton sbtn_DangXuat;
        private System.Windows.Forms.ToolStripLabel lb_CurrentUserName;
    }
}