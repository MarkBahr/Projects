/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vacationplanner;

import java.util.Scanner;

/**
 *
 * @author Bahr
 */
public class VacationPlanner {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
        Scanner input = new Scanner(System.in);
        System.out.println("Welcome to Family Reunion Planner!");
        System.out.print("What is your name?  ");
        String yourName = input.nextLine();
        System.out.println("Great to meet you " + yourName + "!");
        System.out.print("Where would you like to go?  ");
        String yourDestination = input.nextLine();
        System.out.println("Great! " + yourDestination + " is a great place to visit!");
        
        System.out.print("How many days are you going to spend in " + yourDestination + "? ");
        int numDays = input.nextInt();
        System.out.print("What is your total budget for this trip in USD? ");
        double totBudget = input.nextDouble();
        System.out.print("What is the currency in " + yourDestination + "? ");
        String currency = input.nextLine();
        System.out.print("What is the currency symbol for your destination?");
        String currSymbol = input.nextLine();
        System.out.print("What is the conversion rate from US dollars to the currency in " + yourDestination + "? For example, there are 19 Mexican Pesos in 1 US Dollar.");
        double conversRate = input.nextDouble();
        
        int numHours = (numDays * 24);
        int numMinutes = (numHours * 60);
        int numSeconds = (numMinutes * 60);
        double budgetPerDay = (totBudget / numDays);
        double destinCurrency = (conversRate * totBudget);
        double destCurrPerDay = (destinCurrency / numDays);
                     
        System.out.println("You will spend " + numDays + " days, " + numHours + " hours, " + numMinutes + " minutes, and " + numSeconds + " seconds at your destination. \n");
        System.out.println("Your total budget for your trip in US dollars is " + totBudget + ". You can spend " + budgetPerDay + " dollars per day.\n");
        System.out.println("Your total budget for your trip in " + currency + " is " + currSymbol + destinCurrency + ". You can spend " + destCurrPerDay + currency + " per day.\n");
    }
    
}
