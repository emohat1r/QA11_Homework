function Main()
{
  FTest();
  STest();
}

function FTest()
{
  Sys.Process("Explorer").Window("Progman", "Program Manager").Window("SHELLDLL_DefView").Window("SysListView32", "FolderView").DblClickItem("HW");
  Sys.Process("NOTEPAD").Window("Notepad", "*").Window("Edit").Click(172, 36);
  Sys.Process("NOTEPAD").Window("Notepad", "*").Window("Edit").Keys("| MY[BS]y name is Andrew!!");
  Sys.Process("NOTEPAD").Window("Notepad", "*").MainMenu.Click("File|Save");
  Sys.Process("NOTEPAD").Window("Notepad", "*").Close();
  TestedApps.notepad.Run();
  Sys.Process("notepad").Window("Notepad", "*").MainMenu.Click("File|Open...");
  Sys.Process("notepad").Window("#32770", "Open").OpenFile("C:\\Documents and Settings\\Tester\\Desktop\\HW.txt", "Text Documents (*.txt)");
  aqObject.CompareProperty(Sys.Process("notepad").Window("Notepad", "HW - Notepad", 1).Window("Edit", "", 1).wText, 0, "Hello world!| My name is Andrew!", false);
  Sys.Process("notepad").Window("Notepad", "*").Close();
}

function STest()
{
  Sys.Process("Explorer").Window("Progman", "Program Manager").Window("SHELLDLL_DefView").Window("SysListView32", "FolderView").DblClickItem("HW");
  Sys.Process("NOTEPAD").Window("Notepad", "*").Window("Edit").Click(172, 36);
  Sys.Process("NOTEPAD").Window("Notepad", "*").Window("Edit").Keys("| MY[BS]y name is Andrew!!");
  Sys.Process("NOTEPAD").Window("Notepad", "*").MainMenu.Click("File|Save");
  Sys.Process("NOTEPAD").Window("Notepad", "*").Close();
  TestedApps.notepad.Run();
  Sys.Process("notepad").Window("Notepad", "*").MainMenu.Click("File|Open...");
  Sys.Process("notepad").Window("#32770", "Open").OpenFile("C:\\Documents and Settings\\Tester\\Desktop\\HW.txt", "Text Documents (*.txt)");
  aqObject.CompareProperty(Sys.Process("notepad").Window("Notepad", "HW - Notepad", 1).Window("Edit", "", 1).wText, 0, "Hello world!| My name is Andrew!", false);
  Sys.Process("notepad").Window("Notepad", "*").Close();
}
