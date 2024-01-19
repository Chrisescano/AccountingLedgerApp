package org.yearup.models;

import java.time.LocalDate;
import java.time.LocalTime;

public class Transaction {
    private int id;
    private int userId;
    private LocalDate date;
    private LocalTime time;
    private String description;
    private String vendor;
    private double amount;
}
