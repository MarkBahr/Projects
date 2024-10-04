/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InventoryTracker;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.stage.Stage;
import javafx.scene.text.Font;
import javafx.geometry.*;

/**
 *
 * @author Bahr
 */
public class MainScreen extends Application {
    
    @Override
    public void start(Stage primaryStage) {
        
        // Creates the main verticle box that contains everything in the scene (scene) in the main screen.
        VBox vBoxInventory = new VBox();
              
        // Label the main verticle box in scene. The first child of vBoxInventory.
        Label label = new Label("Inventory Management System");
        label.setFont(new Font("Arial", 20));
        label.setStyle("-fx-padding: 20;");
        
        // Creates a horizontal box that contains both the parts and products boxes. It's the 2nd child of vBoxInventory.
        HBox hBoxManage = new HBox();
        
        // HBox to hold the Exit Button.
        HBox hBoxExit = new HBox();
                
        // Creates an exit button. It's the thrid child of vBoxInventory.
        Button btnExit = new Button("Exit");
        btnExit.setStyle("-fx-padding: 5 20 5 20;");
        btnExit.setMinWidth(70);
        
        // Vbox that contains the parts table and buttons.
        VBox vBoxParts = new VBox();
        vBoxParts.setStyle("-fx-padding: 12;" +
                "-fx-border-style: solid inside;" +
                "-fx-border-width: 1;" +
                "-fx-border-color: gray;" +
                "-fx-border-insets: 15;" +
                "-fx-border-radius: 6;");
        
        // HBox that contains the "Parts" label, search button and search text field.
        HBox hBoxParts = new HBox();
        hBoxParts.setSpacing(12);
        hBoxParts.setPadding(new Insets(10, 10, 10, 10));
        
        // Table that contains information on each part.
        TableView partsTable = new TableView();
        
        // Horizontal row for the part editing buttons.
        HBox hBoxEditPart = new HBox();
        hBoxEditPart.setStyle("-fx-padding: 10 0 0 0;");
        
        // VBox that contains the products table and buttons.
        VBox vBoxProducts = new VBox();
        vBoxProducts.setStyle("-fx-padding: 12;" +
                "-fx-border-style: solid inside;" +
                "-fx-border-width: 1;" +
                "-fx-border-color: gray;" +
                "-fx-border-insets: 15;" +
                "-fx-border-radius: 6;");
        
        // HBox that contains the "Products" label, search button and search text field.
        HBox hBoxProducts = new HBox();
        hBoxProducts.setSpacing(12);
        hBoxProducts.setPadding(new Insets(10, 10, 10, 10));    
        
        // Table that contins information on each product.
        TableView productsTable = new TableView();
        
        // Horizontal row for the product editing buttons.
        HBox hBoxEditProduct = new HBox();
        hBoxEditProduct.setStyle("-fx-padding: 10 0 0 0;");
               
        // Label for the parts Vbox.
        Label labelParts = new Label("Parts");
        labelParts.setFont(new Font("Arial", 16));
        labelParts.setStyle("-fx-padding: 0 160 0 0;" +
                "-fx-font-weight: bold");
                
        // Buttons for the parts box with formatting.
        Button btnSearchParts = new Button("Search");
        btnSearchParts.setStyle("-fx-padding: 5 20 5 20;");
        btnSearchParts.setMinWidth(70);
        Button btnAddPart = new Button("Add");
        btnAddPart.setStyle("-fx-padding: 5 20 5 20;");
        btnAddPart.setMinWidth(70);
        Button btnModifyPart = new Button("Modify");
        btnModifyPart.setStyle("-fx-padding: 5 20 5 20;");
        btnModifyPart.setMinWidth(70);
        Button btnDeletePart = new Button("Delete");
        btnDeletePart.setStyle("-fx-padding: 5 20 5 20;");
        btnDeletePart.setMinWidth(70);
        
        // Text field created in order to search for parts.
        TextField searchParts = new TextField();
        searchParts.setPrefWidth(200);
        
        // label for the products VBox.
        Label labelProducts = new Label("Products");
        labelProducts.setFont(new Font("Arial", 16));
        labelProducts.setStyle("-fx-padding: 0 134 0 0;"  +
                "-fx-font-weight: bold");
                       
        // Buttons for the parts box with formatting.
        Button btnSearchProducts = new Button("Search");
        btnSearchProducts.setStyle("-fx-padding: 5 20 5 20;");
        btnSearchProducts.setMinWidth(70);
        Button btnAddProduct = new Button("Add");
        btnAddProduct.setStyle("-fx-padding: 5 20 5 20;");
        btnAddProduct.setMinWidth(70);
        Button btnModifyProduct = new Button("Modify");
        btnModifyProduct.setStyle("-fx-padding: 5 20 5 20;");
        btnModifyProduct.setMinWidth(70);
        Button btnDeleteProduct = new Button("Delete");
        btnDeleteProduct.setStyle("-fx-padding: 5 20 5 20;");
        btnDeleteProduct.setMinWidth(70);
        
        // Text field created in order to search for products.
        TextField searchProducts = new TextField();
        searchProducts.setPrefWidth(200);
        
        // Columns in the parts table.
        TableColumn partID = new TableColumn("Part ID");
        TableColumn partName = new TableColumn("Part Name");
        TableColumn inventoryLevel = new TableColumn("Inventory Level");
        TableColumn costPerUnit = new TableColumn("Price/Cost per Unit");
        
        // Adds the columns to the parts table.
        partsTable.getColumns().addAll(partID, partName, inventoryLevel, costPerUnit);
        
        // Columns in the products table.
        TableColumn productID = new TableColumn("Product ID");
        TableColumn productName = new TableColumn("Product Name");
        TableColumn prodInventoryLevel = new TableColumn("Inventory Level");
        TableColumn pricePerUnit = new TableColumn("Price per Unit");
        
        // Adds teh columns to the products table.
        productsTable.getColumns().addAll(productID, productName, prodInventoryLevel, pricePerUnit);
        
        // Set widths for the parts table columns
        partsTable.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
        partID.setMinWidth(120);
        partName.setMinWidth(120);
        inventoryLevel.setMinWidth(120);
        costPerUnit.setMinWidth(130);
        
        // Set widths for the products table columns.
        productsTable.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
        productID.setMinWidth(120);
        productName.setMinWidth(120);
        prodInventoryLevel.setMinWidth(120);
        pricePerUnit.setMinWidth(130);
        
        // Add to both products and parts their top label, search button, and text field for searching.
        hBoxParts.getChildren().addAll(labelParts, btnSearchParts, searchParts);
        hBoxProducts.getChildren().addAll(labelProducts, btnSearchProducts, searchProducts);
        
        // Add the add, modify and delete buttons to their corresponding boxes. (products of parts)
        hBoxEditPart.getChildren().addAll(btnAddPart, btnModifyPart, btnDeletePart);
        hBoxEditPart.setSpacing(10);
        hBoxEditPart.setAlignment(Pos.CENTER);
        hBoxEditProduct.getChildren().addAll(btnAddProduct, btnModifyProduct, btnDeleteProduct);
        hBoxEditProduct.setSpacing(10);
        hBoxEditProduct.setAlignment(Pos.CENTER);
        
        // Add all the components of the main Verticle Box.
        vBoxParts.getChildren().addAll(hBoxParts, partsTable, hBoxEditPart);
        vBoxProducts.getChildren().addAll(hBoxProducts, productsTable, hBoxEditProduct);
        hBoxManage.getChildren().addAll(vBoxParts, vBoxProducts);
        
        hBoxExit.getChildren().add(btnExit);
        hBoxExit.setAlignment(Pos.BOTTOM_RIGHT);
        hBoxExit.setStyle("-fx-padding: 5 60 5 5;");
        
        // Add the main verticle box to the scene.
        Scene scene = new Scene(vBoxInventory, 400, 600);
        
        // Formatting for the main verticle box.
        vBoxInventory.setSpacing(5);
        vBoxInventory.setPadding(new Insets(10, 10, 10, 10));
        vBoxInventory.getChildren().addAll(label, hBoxManage, hBoxExit);
        
        // Stage height & width.
        primaryStage.setWidth(1200);
        primaryStage.setHeight(450);
        
        // Title for the main stage window.
        primaryStage.setTitle("Inventory Tracker 1.0");
        
        // Add scene to the stage and show.
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    }
    
}