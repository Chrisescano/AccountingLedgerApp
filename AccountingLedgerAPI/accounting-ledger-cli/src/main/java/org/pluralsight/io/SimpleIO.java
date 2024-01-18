package org.pluralsight.io;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.InputMismatchException;
import java.util.Locale;
import java.util.Scanner;

public class SimpleIO {
    private static final Scanner scanner = new Scanner(System.in);

    /*-----Static Factory Methods-----*/
    public static String getLine(String prompt) {
        System.out.print(prompt);
        return scanner.nextLine().trim();
    }

    public static char getChar(String prompt) {
        return getLine(prompt).toUpperCase().charAt(0);
    }

    public static int getInt(String prompt) {
        while (true) {
            System.out.print(prompt);
            try {
                int input = scanner.nextInt();
                scanner.nextLine();
                return input;
            } catch (InputMismatchException e) {
                System.out.println("Expecting An Integer. Please Try Again");
                scanner.nextLine();
            }
        }
    }

    public static double getDouble(String prompt) {
        while (true) {
            System.out.print(prompt);
            try {
                double input = scanner.nextDouble();
                scanner.nextLine();
                return input;
            } catch (InputMismatchException e) {
                System.out.println("Expecting A Double. Please Try Again");
            }
        }
    }

    public static LocalDate getDate(String prompt) {
        while (true) {
            try {
                String input = getLine(prompt);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd").withLocale(Locale.US);
                return LocalDate.parse(input, formatter);
            } catch (DateTimeParseException e) {
                System.out.println("Oops, Wrong Date Format. Please Try Again");
            } catch (Exception e) {
                System.out.println("Oops, Something Went Wrong. Please Try Again");
                e.printStackTrace();
            }
        }
    }

    public static LocalTime getTime(String prompt) {
        while (true) {
            try {
                String input = getLine(prompt);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
                return LocalTime.parse(input, formatter);
            } catch (DateTimeParseException e) {
                System.out.println("Oops, Wrong Date Format. Please Try Again");
            } catch (Exception e) {
                System.out.println("Oops, Something Went Wrong. Please Try Again");
                e.printStackTrace();
            }
        }
    }
}
