package org.pluralsight.app;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public record Transaction(LocalDateTime timeStamp, String description, String vendor, double amount) {
    public LocalDate date() {
        return timeStamp.toLocalDate();
    }

    public String dateString() {
        return timeStamp.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    public LocalTime time() {
        return timeStamp.toLocalTime();
    }

    public String timeString() {
        return timeStamp.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
    }

    public String amountString() {
        return new DecimalFormat("0.00").format(amount);
    }
}
