package grocerybill

/**
 *
 * @author Bahr
 */

import java.util.Scanner;

public class GroceryBill {
	
	public static void main(String [] args){
		
		Scanner keyboard = new Scanner(System.in);
		System.out.println("Welcome to Any Bill Estimator!");
		System.out.print("Do you wish to add an item to your shopping list? (Enter 1 for yes, or 0 for no): " );
		int addItem = input.nextInt();
		float subTotal = 0;
		
		while(addItem = 1) {
			System.out.println("Enter the name of your the item: ");
			String itemName = input.nextLine();
			System.out.println("Enter the cost of " + itemName + " in U.S. dollars: ");
			float itemPrice = input.nextFloat();
			System.out.println("Enter the number/amount of " + itemName + " you wish to buy: ");
			float itemAmount = input.nextFloat();
			itemCost = (itemPrice * itemAmount);
			System.out.println("You will be charged " + itemCost + " for purchasing " + itemName + ".");
			subTotal = (itemCost + subTotal);
			System.out.println("Your estimated subtotal before taxes is: " + subTotal);
			System.out.println("Do you wish to add another product to your estimate? (Enter 1 for yes, or 0 for no): "
		}

		float totalBill = ((subTotal * .1) + subTotal);
		System.out.println("Your total estimate, including taxes is " + totalBill);
	}
}



import java.util.Scanner;

public class groceryBill {
	
	public static void main(String[] args) {
	    
	    Scanner keyboard = new Scanner(System.in);
		System.out.println("Enter your name: ");
	    String yourName = keyboard.nextLine();
	    System.out.println("Your name is " + yourName + ".");
	}
}