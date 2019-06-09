package typeracer;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Vector;

public class readfile {
	public Vector<String> contents;
	public int num;
	
	public readfile() {
		contents = new Vector<String>();
		num = 0;
	}
	
	public void read(String filename) {
		try {
			FileReader fr = new FileReader(filename);
			BufferedReader br = new BufferedReader(fr);
			String line = br.readLine();
			while(line != null) {
				num += line.length();
				contents.add(line);
				line = br.readLine();
			}
		} catch (FileNotFoundException fnfe) {
		} catch (IOException ioe) {
		}
	}
	
	/*public static void main(String[] args) {
		readfile rf = new readfile();
		rf.read("bubblesort.txt");
		System.out.println(rf.contents.size());
		System.out.println(rf.contents.get(0).length());
		System.out.println(rf.num);
	}*/
}
