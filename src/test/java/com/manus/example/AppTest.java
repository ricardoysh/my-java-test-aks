package com.manus.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class AppTest {

    @Test
    void getMessageShouldReturnHelloWorld() {
        // Arrange
        String expected = "Hello World!";

        // Act
        String actual = App.getMessage();

        // Assert
        assertEquals(expected, actual, "A mensagem deve ser 'Hello World!'");
    }
}
