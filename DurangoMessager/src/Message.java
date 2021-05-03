import org.davidmoten.text.utils.WordWrap;

import javax.swing.*;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Message {
    private String dialog;
    private int number;
    private String function;
    public Message(String s,int i,String f) {
        dialog = s;
        number = i;
        function = f;
    }

    public String getDialog() {
        return dialog;
    }

    public void setDialog(String dialog) {
        this.dialog = dialog;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public String getFunction() {
        return function;
    }
    public String compile() {
        String tmp = "";
        String wrapped = WordWrap.from(dialog).maxWidth(37).insertHyphens(true).wrap().replaceAll("\n","~");
        if(charCount(wrapped) > 5)  {

            JOptionPane.showMessageDialog(null, "Warning! Message number #" + number + " has too many lines! This will require manual fixing! (because im lazy)");

        }
        tmp += "scr_dialog_add_line(" + number + ", \"" + wrapped + "~\", \"\", \""+function+"\",-1,1);\n";
        return tmp;
    }
    @Override
    public String toString() {
        return "Line #" + number + " " + dialog + " / " + function;
    }
    private int charCount(String s) {
        int count = 0;

        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '~') {
                count++;
            }
        }
        return count;

    }

}
