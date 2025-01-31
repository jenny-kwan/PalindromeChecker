import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files

public class PalindromeChecker {

    public void tester() {
        String[] lines = new String[6]; 
        try {
            File myFile = new File("palindromes.txt");
            Scanner myReader = new Scanner(myFile);
            int counter = 0;
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                lines[counter] = data;
                counter++;
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }

        System.out.println("there are " + lines.length + " lines");
        for (int i = 0; i < lines.length; i++) {
            if (palindrome(lines[i])) {
                System.out.println(lines[i] + " IS a palindrome.");
            } else {
                System.out.println(lines[i] + " is NOT a palindrome.");
            }
        }
    }

    public boolean palindrome(String word) {
        String cleanedWord = onlyLetters(word).toLowerCase();
        return cleanedWord.equals(reverse(cleanedWord));
    }

    public String reverse(String str) {
        StringBuilder reversed = new StringBuilder(str);
        return reversed.reverse().toString();  
    }

    public String onlyLetters(String str) {
        StringBuilder cleaned = new StringBuilder();
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (Character.isLetter(c)) {
                cleaned.append(c);
            }
        }
        return cleaned.toString();
    }
}
