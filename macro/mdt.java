package macro;
import java.io.*;
import java.io.File;
import java.util.Scanner;

public class mdt {
    public static void main(String args[]) throws IOException {
        int MDTC = 1;
        String output = new Scanner(new File("file.txt")).useDelimiter("\\Z").next();
        String result[] = output.split("\n");
        System.out.println("\n\nMACRO DEF TABLE\n");
        System.out.println("INDEX\tCARD");
        for (int i = 1; i < result.length; i++) {
            System.out.println(MDTC + "\t" + result[i]);
            MDTC = MDTC + 1;
        }
    }
}
