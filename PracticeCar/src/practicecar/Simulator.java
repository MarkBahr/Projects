/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practicecar;

import java.util.ArrayList;

/**
 *
 * @author Bahr
 */
public class Simulator {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
               
        //Introduces the car.
        System.out.println("This new Chevy Silverado is pretty sweet!");
        
        // Makes a new ArrayList of CarPart objects.
        ArrayList<CarPart> list = new ArrayList<>();
        
        // Create intance of each car part.
        Engine chevy = new Engine();
        Wheels fourWheel = new Wheels(); 
        FuelTank fuelTank = new FuelTank();
        
        // Add car parts to the ArrayList.
        list.add(chevy);
        list.add(fourWheel);
        list.add(fuelTank);
        
        // Iterate through each car part.
        for (CarPart x : list){
            x.function();
        }    
    }
}
