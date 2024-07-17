/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplicationpractice;

/**
 *
 * @author Bahr
 */
import java.util.Scanner;
public class JavaApplicationPractice {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner keyboardInput = new Scanner(System.in);
        
        System.out.print("Enter an animal: ");
        String animal = keyboardInput.nextLine();
        System.out.print("Enter a size: ");
        String size = keyboardInput.nextLine();
        System.out.print("Enter a type of weather: ");
        String weather = keyboardInput.nextLine();
        System.out.print("Enter a feeling: ");
        String feeling = keyboardInput.nextLine();
        System.out.print("Enter a landform: ");
        String landform = keyboardInput.nextLine();
        System.out.print("Enter an adjective describing your landform: ");
        String landAdjective = keyboardInput.nextLine();
        System.out.print("Enter a preposition: ");
        String preposition1 = keyboardInput.nextLine();
        System.out.print("Enter anothre preposition: ");
        String preposition2 = keyboardInput.nextLine();
        System.out.print("Enter a third preposition: ");
        String preposition3 = keyboardInput.nextLine();
        
                System.out.println("  \n"
                + "We're going on a " + animal + " hunt. \n"
                + "We're going to catch a " + size + " one. \n"
                + "What a " + weather + " day! \n" 
                + "We're not " + feeling + ". \n"
                + "Oh-oh! A " + landform + "! \n"
                + "A " + landAdjective + " " + landform + ". \n"
                + "We can't go " + preposition1 + " it. \n"
                + "We can't go " + preposition2 + " it. \n"
                + "Oh, no! We've got to go " + preposition3 + " it! \n");
        // TODO code application logic here
    }
    
}