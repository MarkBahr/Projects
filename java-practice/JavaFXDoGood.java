/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javafxdogood;

import javafx.application.*;
import javafx.beans.property.SimpleStringProperty;
import javafx.geometry.Insets;
import javafx.scene.layout.*;
import javafx.scene.text.Font;
import javafx.scene.*;
import javafx.scene.control.*;
import javafx.stage.*;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.collections.ObservableList;
import javafx.collections.FXCollections;
import javafx.event.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.print.PrinterJob;


/**
 *
 * @author Bahr
 */
public class JavaFXDoGood extends Application {
    
    private TableView<Task> tableChron = new TableView<Task>();
    private ObservableList<Task> data =
        FXCollections.observableArrayList(
        new Task("Wash car", "Saturday", "8:00am", "Monthly", "Dad", "Squeaky clean"),
        new Task("Java project", "Mon & Wed", "6:00am", "Apr 23", "Professor Lambda", "Use JavaFX, git & command line"));
        
    final HBox hb = new HBox();
    Label response;
    
    private Desktop desktop = Desktop.getDesktop();
    
    public static void main(String[] args) {
        launch(args);
    }
    
    @Override
    public void start(Stage primaryStage) {
        
        //To create: Add check box next to each task you add, delete and edit buttons, add a week and month view, and a menu on top so you can save different copies. 
                
        VBox vBox1 = new VBox(); // Create new vertical box.
	Scene scene1 = new Scene(vBox1); // Create scene1.
	vBox1.setSpacing(7); // Spacing for box.
	
        response = new Label("Menu");
        
	MenuBar menuBar = new MenuBar();
        
        Menu fileMenu = new Menu("_File"); // Alt-f shortcut for file 
        MenuItem open = new MenuItem("Open...");
        MenuItem save = new MenuItem("Save As...");
        MenuItem print = new MenuItem("Print...");
        MenuItem exit = new MenuItem("Exit");
        SeparatorMenuItem separator = new SeparatorMenuItem();
               
        fileMenu.getItems().add(open);
        fileMenu.getItems().add(save);
        fileMenu.getItems().add(print);
        fileMenu.getItems().add(separator);
        fileMenu.getItems().add(exit);
                        
        menuBar.getMenus().add(fileMenu);
        
        // Create one event handler that will handle menu action events.
        EventHandler<ActionEvent> MEHandler = 
                new EventHandler<ActionEvent>() {
            public void handle(ActionEvent ae) {
                String name = ((MenuItem)ae.getTarget()).getText();
 
                // if Exit is chosen, the program is  terminated.
                if(name.equals("Exit")) Platform.exit();
 
                response.setText( name + " selected");
            }
        };
        
        open.setOnAction(MEHandler);
        save.setOnAction(MEHandler);
        print.setOnAction(MEHandler);
        exit.setOnAction(MEHandler);
        
        final FileChooser fileChooser = new FileChooser();
                        
        open.setOnAction(
                new EventHandler<ActionEvent>(){
                    @Override
                    public void handle(final ActionEvent e) {
                        File opensFile = fileChooser.showOpenDialog(primaryStage);
                        if (opensFile != null) {
                            openFile(opensFile);
                        }
                    }
                
                });
        
        save.setOnAction(
                new EventHandler<ActionEvent>(){
                    @Override
                    public void handle(ActionEvent e) {
                        File savesFile = fileChooser.showSaveDialog(primaryStage);
                        if (savesFile != null) {
                            saveFile(savesFile);
                        }
                    }
                    
                });
        
        // Allow a clicks on the print menuItem to open the print dialogue box.
        print.setOnAction(
                new EventHandler<ActionEvent>(){
                    @Override
                    public void handle(ActionEvent e) {
                        PrinterJob job = PrinterJob.createPrinterJob();
                        if (job != null) {
                            boolean showPrintDialog = job.showPrintDialog(primaryStage.getOwner());
                            if(showPrintDialog){
                                job.endJob();
                            }
                        }
                    }
                });
                                      
        final Label label = new Label("To Do List"); // Main window heading label.
	label.setFont(new Font("Arial", 18));
        label.setPadding(new Insets(10, 10, 10, 10));
        
        tableChron.setEditable(true);
        
        // Column headings in the tableChron.
	TableColumn taskCol = new TableColumn("Task");
	TableColumn dayCol = new TableColumn("Day");
        TableColumn timeCol = new TableColumn("Time");
        TableColumn deadlineCol = new TableColumn("Deadline");
	TableColumn mentorCol = new TableColumn("Mentor");
	TableColumn descriptionCol = new TableColumn("Task Description");
                
        taskCol.setCellValueFactory(
            new PropertyValueFactory<Task, String>("Task"));
        taskCol.setCellFactory(TextFieldTableCell.forTableColumn());
        taskCol.setOnEditCommit(
            new EventHandler<TableColumn.CellEditEvent<Task, String>>() {
                @Override
                public void handle(TableColumn.CellEditEvent<Task, String> t) {
                    ((Task) t.getTableView().getItems().get(
                        t.getTablePosition().getRow())
                        ).setToDo(t.getNewValue());
                }
            }
        );
        
        dayCol.setCellValueFactory(
            new PropertyValueFactory<Task, String>("Day"));
        dayCol.setCellFactory(TextFieldTableCell.forTableColumn());
        dayCol.setOnEditCommit(
            new EventHandler<TableColumn.CellEditEvent<Task, String>>() {
                @Override
                public void handle(TableColumn.CellEditEvent<Task, String> t) {
                    ((Task) t.getTableView().getItems().get(
                        t.getTablePosition().getRow())
                        ).setDay(t.getNewValue());
                }
            }
        );
        
        timeCol.setCellValueFactory(
            new PropertyValueFactory<Task, String>("Time"));
        timeCol.setCellFactory(TextFieldTableCell.forTableColumn());
        timeCol.setOnEditCommit(
            new EventHandler<TableColumn.CellEditEvent<Task, String>>() {
                @Override
                public void handle(TableColumn.CellEditEvent<Task, String> t) {
                    ((Task) t.getTableView().getItems().get(
                        t.getTablePosition().getRow())
                        ).setTime(t.getNewValue());
                }
            }
        );
        
        deadlineCol.setCellValueFactory(
            new PropertyValueFactory<Task, String>("Deadline"));
        deadlineCol.setCellFactory(TextFieldTableCell.forTableColumn());
        deadlineCol.setOnEditCommit(
            new EventHandler<TableColumn.CellEditEvent<Task, String>>() {
                @Override
                public void handle(TableColumn.CellEditEvent<Task, String> t) {
                    ((Task) t.getTableView().getItems().get(
                        t.getTablePosition().getRow())
                        ).setDeadline(t.getNewValue());
                }
            }
        );
        
        mentorCol.setCellValueFactory(
            new PropertyValueFactory<Task, String>("Mentor"));
        mentorCol.setCellFactory(TextFieldTableCell.forTableColumn());
        mentorCol.setOnEditCommit(
            new EventHandler<TableColumn.CellEditEvent<Task, String>>() {
                @Override
                public void handle(TableColumn.CellEditEvent<Task, String> t) {
                    ((Task) t.getTableView().getItems().get(
                        t.getTablePosition().getRow())
                        ).setMentor(t.getNewValue());
                }
            }
        );
        
        descriptionCol.setCellValueFactory(
            new PropertyValueFactory<Task, String>("Description"));
        descriptionCol.setCellFactory(TextFieldTableCell.forTableColumn());
        descriptionCol.setOnEditCommit(
            new EventHandler<TableColumn.CellEditEvent<Task, String>>() {
                @Override
                public void handle(TableColumn.CellEditEvent<Task, String> t) {
                    ((Task) t.getTableView().getItems().get(
                        t.getTablePosition().getRow())
                        ).setDescription(t.getNewValue());
                }
            }
        );
        
        tableChron.setItems(data);
	tableChron.getColumns().addAll(taskCol, dayCol, timeCol, deadlineCol, mentorCol, descriptionCol); // Place the column headings in tableChron.
	// Set width
	tableChron.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
	taskCol.setMinWidth(150);
	dayCol.setMinWidth(70);
        timeCol.setMinWidth(60);
	deadlineCol.setMinWidth(60);
	mentorCol.setMinWidth(120);
	descriptionCol.setMinWidth(200);

	// Create horizontal box.
	HBox hbox1 = new HBox();
	hbox1.setSpacing(8);
        hbox1.setPadding(new Insets(10, 10, 10, 10));
                
        // Create text fields so the user can enter new tasks into the table.
	TextField addToDo = new TextField();
	TextField addDay = new TextField();
        TextField addTime = new TextField();
        TextField addDeadline = new TextField();
	TextField addMentor = new TextField();
	TextField addDescription = new TextField();
        
        // Set initial text in fields.
	addToDo.setText("Enter task");
        addDay.setText("Enter day");
        addTime.setText("Time");
        addDeadline.setText("Deadline");
        addMentor.setText("Give report to...");
	addDescription.setText("Add specific descriptions");

        // Set length
        addToDo.setPrefWidth(150);
        addDay.setPrefWidth(75);
        addTime.setPrefWidth(65);
        addDeadline.setPrefWidth(65);
        addMentor.setPrefWidth(120);
        addDescription.setPrefWidth(150);
        
	// Create add button. 
	Button btnAdd = new Button("Add");
	btnAdd.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent e) {
                data.add(new Task(
                    addToDo.getText(),
                    addDay.getText(),
                    addTime.getText(),
                    addDeadline.getText(),
                    addMentor.getText(),
                    addDescription.getText()));
                addToDo.clear();
                addDay.clear();
                addTime.clear();
                addDeadline.clear();
                addMentor.clear();
                addDescription.clear();
            }
        });
        
        // Get user entry fields all in a horizontal row.
	hbox1.getChildren().addAll(addToDo, addDay, addTime, addDeadline, addMentor, addDescription, btnAdd);
		
	// Get all items in a vertical, stacking format.
	vBox1.getChildren().addAll(menuBar, label, tableChron, hbox1);

	primaryStage.setWidth(750);
	primaryStage.setHeight(500);
	primaryStage.setTitle("Task Tracker 1.0"); // Names the window.
	primaryStage.setScene (scene1); // Sets the scene to the stage.
	primaryStage.show(); // Shows the stage.
    }
    
    public static class Task {
        
        private final SimpleStringProperty todo;
        private final SimpleStringProperty day;
        private final SimpleStringProperty time;
        private final SimpleStringProperty deadline;
        private final SimpleStringProperty mentor;
        private final SimpleStringProperty description;
               
        private Task(String todo1, String day1, String time1, String deadline1, String mentor1, String description1){
            
            this.todo = new SimpleStringProperty(todo1);
            this.day = new SimpleStringProperty (day1);
            this.time = new SimpleStringProperty(time1);
            this.deadline = new SimpleStringProperty(deadline1);
            this.mentor = new SimpleStringProperty(mentor1);
            this.description = new SimpleStringProperty(description1);
        }
        
        public String getToDo() {
            return todo.get();
        }
        
        public void setToDo(String todo1) {
            todo.set(todo1);
        }
        
        public String getDay() {
            return day.get();
        }
        
        public void setDay(String day1) {
            day.set(day1);
        }
        
        public String getTime() {
            return time.get();
        }
        
        public void setTime(String time1) {
            time.set(time1);
        }
        
        public String getDeadline() {
            return deadline.get();
        }
        
        public void setDeadline(String deadline1) {
            deadline.set(deadline1);
        }
        
        public String getMentor() {
            return mentor.get();
        }
        
        public void setMentor(String mentor1) {
            mentor.set(mentor1);
        }
        
        public String getDescription() {
            return description.get();
        }
        
        public void setDescription(String deadline1) {
            description.set(deadline1);
        }
                
    }
    
    private void openFile(File opensFile) {
        try{
            desktop.open(opensFile);
        } catch (IOException ex) {
            Logger.getLogger(
                    JavaFXDoGood.class.getName()).log(
                            Level.SEVERE, null, ex
                    );
        }
    }
    
    private void saveFile(File savesFile) {
        try{
            desktop.open(savesFile);
        } catch (IOException ex) {
            Logger.getLogger(
                    JavaFXDoGood.class.getName()).log(
                            Level.SEVERE, null, ex
                    );
        }
    }
}