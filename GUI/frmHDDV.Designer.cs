namespace KaraokeICOOL
{
    partial class frmHDDV
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.txtdonGia = new System.Windows.Forms.TextBox();
            this.txtmaHD = new System.Windows.Forms.TextBox();
            this.txtTongTien = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.dgv_HDDV = new System.Windows.Forms.DataGridView();
            this.dgv_CTHDDV = new System.Windows.Forms.DataGridView();
            this.txtTenDV = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txtmaDV = new System.Windows.Forms.TextBox();
            this.txtmaCTHDDV = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.dgv_dichvu = new System.Windows.Forms.DataGridView();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btnResetCTHDDV = new System.Windows.Forms.Button();
            this.btnUpdateCTHDDV = new System.Windows.Forms.Button();
            this.btnXoaCTHDDV = new System.Windows.Forms.Button();
            this.btnThemCTHDV = new System.Windows.Forms.Button();
            this.btnReset = new System.Windows.Forms.Button();
            this.btnxoa = new System.Windows.Forms.Button();
            this.btnThem = new System.Windows.Forms.Button();
            this.btnFind = new System.Windows.Forms.Button();
            this.num_sl = new System.Windows.Forms.NumericUpDown();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_HDDV)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_CTHDDV)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_dichvu)).BeginInit();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.num_sl)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(187)))), ((int)(((byte)(54)))), ((int)(((byte)(137)))));
            this.label1.Location = new System.Drawing.Point(515, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(382, 46);
            this.label1.TabIndex = 0;
            this.label1.Text = "HOÁ ĐƠN DỊCH VỤ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(187)))), ((int)(((byte)(54)))), ((int)(((byte)(137)))));
            this.label2.Location = new System.Drawing.Point(47, 98);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(220, 29);
            this.label2.TabIndex = 1;
            this.label2.Text = "Mã hoá đơn dịch vụ";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(187)))), ((int)(((byte)(54)))), ((int)(((byte)(137)))));
            this.label3.Location = new System.Drawing.Point(47, 147);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(115, 29);
            this.label3.TabIndex = 2;
            this.label3.Text = "Tổng tiền";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(187)))), ((int)(((byte)(54)))), ((int)(((byte)(137)))));
            this.label4.Location = new System.Drawing.Point(756, 141);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(109, 29);
            this.label4.TabIndex = 3;
            this.label4.Text = "Số lượng";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(187)))), ((int)(((byte)(54)))), ((int)(((byte)(137)))));
            this.label5.Location = new System.Drawing.Point(477, 86);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(137, 29);
            this.label5.TabIndex = 4;
            this.label5.Text = "Tên dịch vụ";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(187)))), ((int)(((byte)(54)))), ((int)(((byte)(137)))));
            this.label6.Location = new System.Drawing.Point(756, 189);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(96, 29);
            this.label6.TabIndex = 5;
            this.label6.Text = "Đơn giá";
            // 
            // txtdonGia
            // 
            this.txtdonGia.Enabled = false;
            this.txtdonGia.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtdonGia.Location = new System.Drawing.Point(897, 186);
            this.txtdonGia.Name = "txtdonGia";
            this.txtdonGia.Size = new System.Drawing.Size(123, 34);
            this.txtdonGia.TabIndex = 9;
            // 
            // txtmaHD
            // 
            this.txtmaHD.Enabled = false;
            this.txtmaHD.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtmaHD.Location = new System.Drawing.Point(292, 95);
            this.txtmaHD.Name = "txtmaHD";
            this.txtmaHD.Size = new System.Drawing.Size(150, 34);
            this.txtmaHD.TabIndex = 10;
            // 
            // txtTongTien
            // 
            this.txtTongTien.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTongTien.Location = new System.Drawing.Point(185, 142);
            this.txtTongTien.Name = "txtTongTien";
            this.txtTongTien.Size = new System.Drawing.Size(192, 34);
            this.txtTongTien.TabIndex = 11;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(398, 147);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(44, 25);
            this.label7.TabIndex = 12;
            this.label7.Text = "vnđ";
            // 
            // dgv_HDDV
            // 
            this.dgv_HDDV.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_HDDV.Location = new System.Drawing.Point(19, 29);
            this.dgv_HDDV.Name = "dgv_HDDV";
            this.dgv_HDDV.RowHeadersWidth = 51;
            this.dgv_HDDV.RowTemplate.Height = 24;
            this.dgv_HDDV.Size = new System.Drawing.Size(345, 325);
            this.dgv_HDDV.TabIndex = 13;
            this.dgv_HDDV.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgv_HDDV_CellClick);
            // 
            // dgv_CTHDDV
            // 
            this.dgv_CTHDDV.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_CTHDDV.Location = new System.Drawing.Point(12, 29);
            this.dgv_CTHDDV.Name = "dgv_CTHDDV";
            this.dgv_CTHDDV.RowHeadersWidth = 51;
            this.dgv_CTHDDV.RowTemplate.Height = 24;
            this.dgv_CTHDDV.Size = new System.Drawing.Size(559, 290);
            this.dgv_CTHDDV.TabIndex = 14;
            this.dgv_CTHDDV.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgv_CTHDDV_CellClick);
            // 
            // txtTenDV
            // 
            this.txtTenDV.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTenDV.Location = new System.Drawing.Point(627, 81);
            this.txtTenDV.Name = "txtTenDV";
            this.txtTenDV.Size = new System.Drawing.Size(313, 34);
            this.txtTenDV.TabIndex = 15;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(187)))), ((int)(((byte)(54)))), ((int)(((byte)(137)))));
            this.label8.Location = new System.Drawing.Point(479, 138);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(127, 29);
            this.label8.TabIndex = 25;
            this.label8.Text = "Mã dịch vụ";
            // 
            // txtmaDV
            // 
            this.txtmaDV.Enabled = false;
            this.txtmaDV.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtmaDV.Location = new System.Drawing.Point(627, 138);
            this.txtmaDV.Name = "txtmaDV";
            this.txtmaDV.Size = new System.Drawing.Size(99, 34);
            this.txtmaDV.TabIndex = 26;
            // 
            // txtmaCTHDDV
            // 
            this.txtmaCTHDDV.Enabled = false;
            this.txtmaCTHDDV.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtmaCTHDDV.Location = new System.Drawing.Point(627, 184);
            this.txtmaCTHDDV.Name = "txtmaCTHDDV";
            this.txtmaCTHDDV.Size = new System.Drawing.Size(99, 34);
            this.txtmaCTHDDV.TabIndex = 28;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(187)))), ((int)(((byte)(54)))), ((int)(((byte)(137)))));
            this.label9.Location = new System.Drawing.Point(479, 189);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(118, 29);
            this.label9.TabIndex = 27;
            this.label9.Text = "Mã HDDV";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dgv_HDDV);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(28, 281);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(378, 367);
            this.groupBox1.TabIndex = 29;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Danh sách hoá đơn dịch vụ";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.dgv_CTHDDV);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(429, 310);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(577, 325);
            this.groupBox2.TabIndex = 30;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Chi tiết hoá đơn dịch vụ";
            // 
            // dgv_dichvu
            // 
            this.dgv_dichvu.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_dichvu.Location = new System.Drawing.Point(14, 30);
            this.dgv_dichvu.Name = "dgv_dichvu";
            this.dgv_dichvu.RowHeadersWidth = 51;
            this.dgv_dichvu.RowTemplate.Height = 24;
            this.dgv_dichvu.Size = new System.Drawing.Size(451, 472);
            this.dgv_dichvu.TabIndex = 31;
            this.dgv_dichvu.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgv_dichvu_CellClick);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.dgv_dichvu);
            this.groupBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox3.Location = new System.Drawing.Point(1039, 121);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(471, 508);
            this.groupBox3.TabIndex = 32;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Dịch vụ";
            // 
            // btnResetCTHDDV
            // 
            this.btnResetCTHDDV.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnResetCTHDDV.Image = global::KaraokeICOOL.Properties.Resources.reset;
            this.btnResetCTHDDV.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnResetCTHDDV.Location = new System.Drawing.Point(500, 248);
            this.btnResetCTHDDV.Name = "btnResetCTHDDV";
            this.btnResetCTHDDV.Size = new System.Drawing.Size(109, 41);
            this.btnResetCTHDDV.TabIndex = 24;
            this.btnResetCTHDDV.Text = "Reset";
            this.btnResetCTHDDV.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnResetCTHDDV.UseVisualStyleBackColor = true;
            this.btnResetCTHDDV.Click += new System.EventHandler(this.btnResetCTHDDV_Click);
            // 
            // btnUpdateCTHDDV
            // 
            this.btnUpdateCTHDDV.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUpdateCTHDDV.Image = global::KaraokeICOOL.Properties.Resources.updated;
            this.btnUpdateCTHDDV.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnUpdateCTHDDV.Location = new System.Drawing.Point(742, 248);
            this.btnUpdateCTHDDV.Name = "btnUpdateCTHDDV";
            this.btnUpdateCTHDDV.Size = new System.Drawing.Size(139, 41);
            this.btnUpdateCTHDDV.TabIndex = 23;
            this.btnUpdateCTHDDV.Text = "Cập nhật";
            this.btnUpdateCTHDDV.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnUpdateCTHDDV.UseVisualStyleBackColor = true;
            this.btnUpdateCTHDDV.Click += new System.EventHandler(this.btnUpdateCTHDDV_Click);
            // 
            // btnXoaCTHDDV
            // 
            this.btnXoaCTHDDV.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXoaCTHDDV.Image = global::KaraokeICOOL.Properties.Resources.delete;
            this.btnXoaCTHDDV.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnXoaCTHDDV.Location = new System.Drawing.Point(628, 248);
            this.btnXoaCTHDDV.Name = "btnXoaCTHDDV";
            this.btnXoaCTHDDV.Size = new System.Drawing.Size(99, 41);
            this.btnXoaCTHDDV.TabIndex = 22;
            this.btnXoaCTHDDV.Text = "Xoá";
            this.btnXoaCTHDDV.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnXoaCTHDDV.UseVisualStyleBackColor = true;
            this.btnXoaCTHDDV.Click += new System.EventHandler(this.btnXoaCTHDDV_Click);
            // 
            // btnThemCTHDV
            // 
            this.btnThemCTHDV.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThemCTHDV.Image = global::KaraokeICOOL.Properties.Resources.add;
            this.btnThemCTHDV.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnThemCTHDV.Location = new System.Drawing.Point(897, 248);
            this.btnThemCTHDV.Name = "btnThemCTHDV";
            this.btnThemCTHDV.Size = new System.Drawing.Size(109, 41);
            this.btnThemCTHDV.TabIndex = 21;
            this.btnThemCTHDV.Text = "Thêm";
            this.btnThemCTHDV.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnThemCTHDV.UseVisualStyleBackColor = true;
            this.btnThemCTHDV.Click += new System.EventHandler(this.btnThemCTHDV_Click);
            // 
            // btnReset
            // 
            this.btnReset.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReset.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btnReset.Image = global::KaraokeICOOL.Properties.Resources.reset;
            this.btnReset.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnReset.Location = new System.Drawing.Point(40, 216);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(109, 41);
            this.btnReset.TabIndex = 20;
            this.btnReset.Text = "Reset";
            this.btnReset.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // btnxoa
            // 
            this.btnxoa.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnxoa.Image = global::KaraokeICOOL.Properties.Resources.delete;
            this.btnxoa.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnxoa.Location = new System.Drawing.Point(155, 216);
            this.btnxoa.Name = "btnxoa";
            this.btnxoa.Size = new System.Drawing.Size(99, 41);
            this.btnxoa.TabIndex = 18;
            this.btnxoa.Text = "Xoá";
            this.btnxoa.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnxoa.UseVisualStyleBackColor = true;
            this.btnxoa.Click += new System.EventHandler(this.btnxoa_Click);
            // 
            // btnThem
            // 
            this.btnThem.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThem.Image = global::KaraokeICOOL.Properties.Resources.add;
            this.btnThem.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnThem.Location = new System.Drawing.Point(273, 216);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(155, 41);
            this.btnThem.TabIndex = 17;
            this.btnThem.Text = "Tạo hoá đơn";
            this.btnThem.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnThem.UseVisualStyleBackColor = true;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // btnFind
            // 
            this.btnFind.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFind.Image = global::KaraokeICOOL.Properties.Resources.find;
            this.btnFind.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnFind.Location = new System.Drawing.Point(960, 78);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(85, 37);
            this.btnFind.TabIndex = 16;
            this.btnFind.Text = "Tìm";
            this.btnFind.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnFind.UseVisualStyleBackColor = true;
            this.btnFind.Click += new System.EventHandler(this.btnFind_Click);
            // 
            // num_sl
            // 
            this.num_sl.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.num_sl.Location = new System.Drawing.Point(897, 142);
            this.num_sl.Name = "num_sl";
            this.num_sl.Size = new System.Drawing.Size(120, 34);
            this.num_sl.TabIndex = 33;
            // 
            // frmHDDV
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1545, 688);
            this.Controls.Add(this.num_sl);
            this.Controls.Add(this.txtmaCTHDDV);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.txtmaDV);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.btnResetCTHDDV);
            this.Controls.Add(this.btnUpdateCTHDDV);
            this.Controls.Add(this.btnXoaCTHDDV);
            this.Controls.Add(this.btnThemCTHDV);
            this.Controls.Add(this.btnReset);
            this.Controls.Add(this.btnxoa);
            this.Controls.Add(this.btnThem);
            this.Controls.Add(this.btnFind);
            this.Controls.Add(this.txtTenDV);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.txtTongTien);
            this.Controls.Add(this.txtmaHD);
            this.Controls.Add(this.txtdonGia);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox3);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "frmHDDV";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "HDDV";
            ((System.ComponentModel.ISupportInitialize)(this.dgv_HDDV)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_CTHDDV)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgv_dichvu)).EndInit();
            this.groupBox3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.num_sl)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtdonGia;
        private System.Windows.Forms.TextBox txtmaHD;
        private System.Windows.Forms.TextBox txtTongTien;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.DataGridView dgv_HDDV;
        private System.Windows.Forms.DataGridView dgv_CTHDDV;
        private System.Windows.Forms.TextBox txtTenDV;
        private System.Windows.Forms.Button btnFind;
        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.Button btnxoa;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnResetCTHDDV;
        private System.Windows.Forms.Button btnUpdateCTHDDV;
        private System.Windows.Forms.Button btnXoaCTHDDV;
        private System.Windows.Forms.Button btnThemCTHDV;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtmaDV;
        private System.Windows.Forms.TextBox txtmaCTHDDV;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.DataGridView dgv_dichvu;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.NumericUpDown num_sl;
    }
}