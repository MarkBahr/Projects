/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practicecar;

/**
 *
 * @author Bahr
 */
public class CarPart implements Functional{
    void status(int partCondition){
        if (partCondition > 98){
            System.out.println("It is in mint condition.");
        } else if (partCondition > 20){
            System.out.println("They are in a pretty decent condition.");
        } else if (partCondition > 0){
            System.out.println("It is nearly worn out!");
        } else if (partCondition == 0){
            System.out.println("It is worn out. Replace immediately!");
        }
    }
    
    public void function(){
    }
}

class Engine extends CarPart {
    int horsePower = 250;
    public void function() {
        System.out.println("It comes with a " + horsePower + " horsepower engine.");
        status(100);
    }
}

class Wheels extends CarPart {
    String tireType = "All Terrain Michelin";
    public void function() {
        System.out.println("It is equipped with " + tireType + " tires.");
        status(50);
    }
    
}

class FuelTank extends CarPart {
    String fuelLevel = "plumb full";
    public void function() {
        System.out.println("The fuel tank is " + fuelLevel + "!");
        status(99);
    }
    
}