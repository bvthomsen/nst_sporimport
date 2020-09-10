using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Diagnostics;



namespace sporimport
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            string[] lines = File.ReadAllLines(Application.StartupPath + "\\profiles.txt");
            Dictionary<string, string> dictionary = lines.Where(line => !line.StartsWith("*")).Select(line => line.Split('#')).ToDictionary(data => data[0], data => data[1]);
            
            cbDatabase.DataSource = new BindingSource(dictionary, null);
            cbDatabase.DisplayMember = "Key";
            cbDatabase.ValueMember = "Value";
            cbDatabase.SelectedIndex = 0;
        }

        private void btIndsaet_Click(object sender, EventArgs e)
        {
            List<String> fullFileName;
            OpenFileDialog OpenFileDialog1 = new OpenFileDialog();

            tbLog.Clear();
            OpenFileDialog1.Multiselect = true;
            OpenFileDialog1.Filter = "ESRI shape filer (*.shp)|*.shp|MapInfo TAB filer (*.tab)|*.tab|Alle filtyper (*.*)|*.*";
            OpenFileDialog1.Title = "Vælg fil(er) som skal indlæses";
            if (OpenFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                fullFileName = new List<String>(OpenFileDialog1.FileNames);
                foreach (string fileName in fullFileName)
                {
                    lbFiler.Items.Add(fileName);
                }
            }
        }


        private void btNulstil_Click(object sender, EventArgs e)
        {
            lbFiler.Items.Clear();
        }

        private void btFjern_Click(object sender, EventArgs e)
        {
            var selectedItems = lbFiler.SelectedItems.Cast<String>().ToList();
            foreach (var item in selectedItems)
                lbFiler.Items.Remove(item);
        }

        private void btAfslut_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void importFile(string homeDir, string encoding, string commandLine, string fileName, string userName, string timeStamp)
        {
            string cmdTmpl = File.ReadAllText(homeDir + "\\OGRShell.tmpl");
            string tmpFile = Path.GetTempFileName().Replace(".tmp", ".cmd");

            cmdTmpl = cmdTmpl.Replace("*commandline*", commandLine);
            cmdTmpl = cmdTmpl.Replace("*homedir*", homeDir);
            cmdTmpl = cmdTmpl.Replace("*encoding*", encoding);
            cmdTmpl = cmdTmpl.Replace("*filename*", fileName);
            cmdTmpl = cmdTmpl.Replace("*tablename*", Path.GetFileNameWithoutExtension(fileName));
            cmdTmpl = cmdTmpl.Replace("*username*", userName);
            cmdTmpl = cmdTmpl.Replace("*timestamp*", timeStamp);
            
            File.WriteAllText(tmpFile, cmdTmpl);

            ProcessStartInfo cmdsi = new ProcessStartInfo("cmd.exe");
            cmdsi.Arguments = " /c \"" + tmpFile + "\"";
            cmdsi.CreateNoWindow = true;
            cmdsi.UseShellExecute = false;
            cmdsi.RedirectStandardOutput = true;
            cmdsi.RedirectStandardError = true;

            
            
            
            tbLog.AppendText("cmd.exe" + cmdsi.Arguments + Environment.NewLine);
            Process cmd = Process.Start(cmdsi);
            tbLog.AppendText(cmd.StandardOutput.ReadToEnd());
            tbLog.AppendText(cmd.StandardError.ReadToEnd());
            cmd.WaitForExit();
            // File.Delete(tmpFile);
        }

        private void btImport_Click(object sender, EventArgs e)
        {
            tbLog.ForeColor = Color.DarkRed;
            foreach (var item in lbFiler.Items)
            {
                string[] args = cbDatabase.SelectedValue.ToString().Split('§');
                //importFile(Application.StartupPath + "\\GDAL", args[0], args[1], item.ToString(), Environment.UserName, DateTime.UtcNow.ToString("o"));
                importFile(Application.StartupPath, args[0], args[1], item.ToString(), Environment.UserName, DateTime.UtcNow.ToString("o"));
            }
            btNulstil.PerformClick();
            tbLog.ForeColor = Color.DarkGreen;

        }
    }
}
