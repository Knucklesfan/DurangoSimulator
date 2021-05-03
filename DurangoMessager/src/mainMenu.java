import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class mainMenu {
    private JButton Add;
    private JButton Delete;
    private JButton Export;
    private JList list1;
    private int number = 0;
    private JPanel mainMenu;
    public ArrayList<Message> dialog;
    public mainMenu() {
        dialog = new ArrayList<Message>();
        list1.setListData(dialog.toArray());
        Add.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent actionEvent) {

                Message r = BoxAlert.main();
                if(r != null) {
                    dialog.add(r);

                    for(int x = 0; x < dialog.size(); x++) {
                        Message temp = dialog.get(x);
                        temp.setNumber(x);
                        dialog.set(x,temp);
                    }
                    list1.setListData(dialog.toArray());
                    number++;
                }
            }
        });
        Delete.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent actionEvent) {
                dialog.remove(list1.getSelectedIndex());
                for(int x = 0; x < dialog.size(); x++) {
                    Message temp = dialog.get(x);
                    temp.setNumber(x);
                    dialog.set(x,temp);
                }
                list1.setListData(dialog.toArray());
            }
        });
        Export.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent actionEvent) {
                String tmp = "";
                for(int x = 0; x < dialog.size(); x++) {
                    tmp += dialog.get(x).compile();
                }
                System.out.println(tmp);
                CodeOutput.main(tmp);
            }
        });


    }
    public static void main(String[] args) {
        JFrame frame = new JFrame("mainMenu");
        frame.setContentPane(new mainMenu().mainMenu);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setVisible(true);

    }


}
