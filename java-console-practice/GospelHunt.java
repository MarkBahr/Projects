/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gospelhunt;

import java.util.Scanner;

/**
 *
 * @author Bahr
 */
public class GospelHunt {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner input = new Scanner(System.in); // Puts the scanner to work.
        System.out.println("You have a great mystery to solve! \n To solve the mystery, you must enter the clues that belong to the secret gospel message.");
        System.out.println("Enter the 1st clue: ");
        String le1 = input.next();
        System.out.println("Enter the 2nd clue: ");
        String le2 = input.next();
        System.out.println("Enter the 3rd clue: ");
        String le3 = input.next();
        String le3b = le3.toUpperCase();
        System.out.println("Enter the 4th clue: ");
        String le4 = input.next();
        System.out.println("Enter the 5th clue: ");
        String le5 = input.next();
        System.out.println("Enter the 6th clue: ");
        String le6 = input.next();
        System.out.println("Enter the 7th clue: ");
        String le7 = input.next();
        System.out.println("Enter the 8th clue: ");
        String le8 = input.next();
        System.out.println("Enter the 9th clue: ");
        String le9 = input.next();
        
        String print = (le3b + le1 + " " + le4 + le8 + " ");
        String print2 = (le5 + le6 + le9 + " " + le3 + le1 + le7 + le1 + ", ");
        String print3 = (le2 + le6 + le7 + " " + le3 + le1);
        String print4 = (" " + le4 + le8);
        String print5 = (" " + le7 + le4 + le8 + le1 + le5 + "!");
        
        System.out.println("- - - - - - - - - - - - - - - - - - - - - - - - - - - \n");
        System.out.println(print + print2 + print3 + print4 + print5);
        System.out.println("Jesus Christ will come again!");
        
    }
    
}
