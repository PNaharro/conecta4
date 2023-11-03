package com.project;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.layout.GridPane;

public class memori {
    @FXML
    private GridPane gridPane;
    private MemoryGameBoard gameBoard;

    public void initialize() {
        // Inicializa el juego y configura el GridPane
        gameBoard = new MemoryGameBoard(gridPane);
        gameBoard.initializeGame();
    }

    @FXML
    private void restartGame() {
        gameBoard.initializeGame();
    }
}
