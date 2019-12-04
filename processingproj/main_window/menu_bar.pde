import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

//menubar
public class Menu_bar 
{
  JFrame frame;

  public Menu_bar(PApplet app, String name)
  {
    System.setProperty("apple.laf.useScreenMenuBar", "true");
    frame = (JFrame) ((processing.awt.PSurfaceAWT.SmoothCanvas)app.getSurface().getNative()).getFrame();
    frame.setTitle(name);

    // Creates a menubar for a JFrame
    JMenuBar menu_bar = new JMenuBar();
    // Add the menubar to the frame
    frame.setJMenuBar(menu_bar);
    // Define and add two drop down menu to the menubar
    JMenu import_menu = new JMenu("Import");
    JMenu edit_menu  = new JMenu("Edit");
    JMenu save_menu = new JMenu("Save");
    JMenu  file_menu = new JMenu("File");
    
    menu_bar.add(file_menu);
    menu_bar.add(import_menu);
    menu_bar.add(save_menu);
    menu_bar.add(edit_menu);

    // Create and add simple menu item to one of the drop down menu
    JMenuItem import_file = new JMenuItem("Import file");
    JMenuItem import_folder = new JMenuItem("Import folder");
    
    JMenuItem exit = new JMenuItem("Exit");
    JMenuItem open = new JMenuItem("Open");
    JMenuItem new_file = new JMenuItem("New");
    
    JMenuItem save = new JMenuItem("Save");
    JMenuItem save_as = new JMenuItem("Save As");
    
    JMenuItem undo = new JMenuItem("Undo");
    JMenuItem redo = new JMenuItem("Redo");
    JMenuItem cut = new JMenuItem("Cut");
    JMenuItem copy = new JMenuItem("Copy");
    JMenuItem paste = new JMenuItem("Paste");

    import_menu.add(import_file);
    import_menu.add(import_folder);
    
    save_menu.add(save);
    save_menu.add(save_as);
    
    edit_menu.add(undo);
    edit_menu.add(redo);
    edit_menu.add(cut);
    edit_menu.add(copy);
    edit_menu.add(paste);
    
    
    file_menu.add(new_file);
    file_menu.add(open);
    file_menu.add(exit);
 
   
    // Add a listener to the exit_menu item. actionPerformed() method will
    // invoked, if user triggred this menu item
    exit.addActionListener(new ActionListener() 
    {
      public void actionPerformed(ActionEvent e) 
      {
        exit();
      }
    }
   );
   
   
   frame.setVisible(true);
  }
}
