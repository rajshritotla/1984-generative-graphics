import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

//menubar
public class Menu_bar {
  JFrame frame;

  public Menu_bar(PApplet app, String name, int width, int height) {
    System.setProperty("apple.laf.useScreenMenuBar", "true");
    frame = (JFrame) ((processing.awt.PSurfaceAWT.SmoothCanvas)app.getSurface().getNative()).getFrame();
    frame.setTitle(name);

    // Creates a menubar for a JFrame
    JMenuBar menu_bar = new JMenuBar();
    // Add the menubar to the frame
    frame.setJMenuBar(menu_bar);
    // Define and add two drop down menu to the menubar
    JMenu import_menu = new JMenu("import");
    JMenu template_menu  = new JMenu("templates");
    JMenu detect_menu = new JMenu("detect");
    JMenu save_menu = new JMenu("save");
    JMenu exit_menu = new JMenu("Exit");
    

    menu_bar.add(import_menu);
    menu_bar.add(detect_menu);
    menu_bar.add(save_menu);
    menu_bar.add(template_menu);
    menu_bar.add(exit_menu);

    // Create and add simple menu item to one of the drop down menu
    JMenuItem new_file = new JMenuItem("Import file");
    JMenuItem new_folder = new JMenuItem("Import folder");
    
    JMenuItem save = new JMenuItem("Save");
    JMenuItem save_as = new JMenuItem("Save As");
    
    JMenuItem ellipse = new JMenuItem("ellipse");
    JMenuItem rectangle = new JMenuItem("rectange");
    
    JMenu move_one_object = new JMenu("move one object");
    JMenu move_background = new JMenu("move background");
    
    JMenuItem detect_face = new JMenuItem("face");
    JMenuItem detect_body = new JMenuItem("body");
    JMenuItem detect_hands = new JMenuItem("hands");

    import_menu.add(new_file);
    import_menu.add(new_folder);
    
    save_menu.add(save);
    save_menu.add(save_as);
    
    move_one_object.add(ellipse);
    move_one_object.add(rectangle);
    
    template_menu.add(move_one_object);
    template_menu.add(move_background);
    
    detect_menu.add(detect_face);
    detect_menu.add(detect_body);
    detect_menu.add(detect_hands);
   
   
    // Add a listener to the New menu item. actionPerformed() method will
    // invoked, if user triggred this menu item
    new_file.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent arg0) {
        if (arg0.getActionCommand().equals("detect_face"))
        {
          
        System.out.println("You have clicked on the new action");
      }
    }
    }
    );
    frame.setVisible(true);
  }
}
