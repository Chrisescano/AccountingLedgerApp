package org.pluralsight.util;

import org.pluralsight.app.Transaction;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Stream;

public class Sort {
    Stream<Transaction> stream;

    public Sort(List<Transaction> transactions) {
        stream = transactions.stream();
    }

    public static Sort using(List<Transaction> transactions) {
        return new Sort(transactions);
    }

    public Sort byDate() {
        stream = stream.sorted(Comparator.comparing(Transaction::timeStamp).reversed());
        return this;
    }

    public Sort byVendor() {
        stream = stream.sorted(Comparator.comparing(Transaction::vendor));
        return this;
    }

    public Sort byAmount() {
        stream = stream.sorted(Comparator.comparing(Transaction::amount).reversed());
        return this;
    }

    public List<Transaction> toList() {
        return new ArrayList<>(stream.toList());
    }
}
