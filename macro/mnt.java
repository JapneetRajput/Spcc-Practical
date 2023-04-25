package macro;
import java.io.*;
import java.io.File;
import java.util.Scanner;

public class mnt {
    public static void main(String args[]) throws IOException {
        int MNTC = 1;
        int macroindex = 0;
        String mname[] = new String[10];
        String output = new Scanner(new File("file.txt")).useDelimiter("\\Z").next();
        String result1[] = output.split("[,\\s\\?]");
        for (int k = 0; k < result1.length; k++) {
            if (result1[k].equals("MACRO") || result1[k].equals("macro")) {
                mname[macroindex] = result1[k + 2];
                macroindex++;
            }
        }
        System.out.println("\nMACRO NAME TABLE\n");
        System.out.println("MNTC\tNAME");
        for (int k = 0; k < macroindex; k++) {
            System.out.println(MNTC + "\t" + mname[k]);
            MNTC = MNTC + 1;
        }
    }
}
