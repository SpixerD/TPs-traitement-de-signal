package sample.Controllers;

import javafx.animation.TranslateTransition;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TableColumn;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.Pane;
import javafx.util.Duration;

import java.io.IOException;

public class AbsenceController {
    int i = 0;
    @FXML
    private Button Absence;

    @FXML
    private TableColumn<?, ?> AbsentColl;

    @FXML
    private Button Calender;

    @FXML
    private ChoiceBox<?> CorurseBox;

    @FXML
    private Button Courses;

    @FXML
    private Button Edit;

    @FXML
    private ImageView EditIcon;

    @FXML
    private Button Grades;

    @FXML
    private Button Help;

    @FXML
    private Button Home;

    @FXML
    private TableColumn<?, ?> JustifCol;

    @FXML
    private Button Logout;

    @FXML
    private Button MenuB;

    @FXML
    private ImageView MenuIconOpen;

    @FXML
    private Pane MenuSlider;

    @FXML
    private TableColumn<?, ?> NameColl;

    @FXML
    private Button Profile;

    @FXML
    private Button Todolist;

    @FXML
    private Button Validate;

    @FXML
    private ChoiceBox<?> classBox;

    @FXML
    void Menu(ActionEvent event) throws IOException {

        i++;

        TranslateTransition slide = new TranslateTransition();
        if (i % 2 != 0) {
            MenuSlider.setTranslateX(-60);
            slide.setDuration(Duration.seconds(0.4));
            slide.setNode(MenuSlider);

            slide.play();


        } else if (i % 2 == 0) {
            slide.setDuration(Duration.seconds(0.4));
            slide.setNode(MenuSlider);

            slide.setToX(0);
            slide.play();
            MenuSlider.setTranslateX(60);


        }

    }
    @FXML
    void GoHome (ActionEvent event) throws IOException {
        HomeController.checkHome();

    }

/*
    @FXML
    void GoAbsence(ActionEvent event)throws IOException {
        HomeController.checkAbsence();

    }


    @FXML
    void GoGrade(ActionEvent event) throws IOException {
        HomeController.checkGrades();

    }

    @FXML
    void GoTodoList(ActionEvent event)throws IOException {
        HomeController.checkTodoList();

    }
    @FXML
    void goHome(ActionEvent event) throws IOException {
        HomeController.checkHome();

    }

    @FXML
    void goSchedule(ActionEvent event) throws IOException {
        HomeController.checkSchedule();
    }
      @FXML
    void Logout(ActionEvent event) throws IOException{
        HomeController.checkLogout();
    }


    @FXML
    void GoCourse(ActionEvent event) {

 @FXML
    void GoHelp(ActionEvent event) throws IOException {
        HomeController.checkHelp();

    }

    @FXML
    void GoProfile(ActionEvent event) throws IOException {
        HomeController.checkProfile();

 */
    }










