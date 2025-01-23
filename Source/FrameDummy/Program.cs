//---------------------------------------------------------------------------- 
// <copyright company="Tecdrop" file="MainForm.cs" project="FrameDummy">
//    Copyright (C) 2013-2025 Tecdrop. All rights reserved. https://www.tecdrop.com
// </copyright> 
// 
// Description: The main FrameDummy program class.
// 
//---------------------------------------------------------------------------

namespace FrameDummy
{
    using System;
    using System.Windows.Forms;

    /// <summary>
    /// The main program class.
    /// </summary>
    public static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        private static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new MainForm());
        }
    }
}
