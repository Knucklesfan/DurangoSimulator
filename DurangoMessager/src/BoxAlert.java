import javax.swing.*;
import java.awt.event.*;

public class BoxAlert extends JDialog {
    private JPanel contentPane;
    private JButton buttonOK;
    private JButton buttonCancel;
    private JEditorPane editorPane1;
    private JTextField textField1;
    private JComboBox comboBox1;
    private static Message editorText;
    public BoxAlert() {
        setContentPane(contentPane);
        setModal(true);
        getRootPane().setDefaultButton(buttonOK);
        
        buttonOK.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onOK();
            }
        });

        buttonCancel.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onCancel();
            }
        });
        comboBox1.setModel(new DefaultComboBoxModel<>(new String[]{"NEXT", "ROOM", "STOP"}));
        // call onCancel() when cross is clicked
        setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                onCancel();
            }
        });

        // call onCancel() on ESCAPE
        contentPane.registerKeyboardAction(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onCancel();
            }
        }, KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
    }

    private void onOK() {
        if(comboBox1.getSelectedIndex() == comboBox1.getItemCount()) {
            editorText = new Message(editorPane1.getText(),0, textField1.getText());
        }
        else {
            editorText = new Message(editorPane1.getText(),0, (String) comboBox1.getSelectedItem());
        }
        dispose();
    }

    private void onCancel() {
        editorText = null;
        dispose();
    }

    public static Message main() {
        BoxAlert dialog = new BoxAlert();
        dialog.pack();
        dialog.setVisible(true);
        return editorText;
    }

}
