package org.pluralsight.util;

import org.pluralsight.app.Transaction;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class Filter {
    private Stream<Transaction> stream;

    public Filter(List<Transaction> transactions) {
        this.stream = transactions.stream();
    }

    public static Filter using(List<Transaction> ledger) {
        return new Filter(ledger);
    }

    public Filter onlyDeposits() {
        stream = stream.filter(transaction -> transaction.amount() >= 0);
        return this;
    }

    public Filter onlyPayments() {
        stream = stream.filter(transaction -> transaction.amount() < 0);
        return this;
    }

    public Filter withDescription(String description) {
        stream = stream.filter(transaction -> transaction.description().contains(description));
        return this;
    }

    public Filter withVendor(String vendor) {
        stream = stream.filter(transaction -> transaction.vendor().contains(vendor));
        return this;
    }

    public Filter withMax(double max) {
        stream = stream.filter(transaction -> transaction.amount() <= max);
        return this;
    }

    public Filter withMin(double min) {
        stream = stream.filter(transaction -> transaction.amount() >= min);
        return this;
    }

    public Filter after(LocalDate date) {
        stream = stream.filter(transaction -> transaction.date().isAfter(date));
        return this;
    }

    public Filter before(LocalDate date) {
        stream = stream.filter(transaction -> transaction.date().isBefore(date));
        return this;
    }

    public List<Transaction> toList() {
        return new ArrayList<>(stream.toList());
    }
}
