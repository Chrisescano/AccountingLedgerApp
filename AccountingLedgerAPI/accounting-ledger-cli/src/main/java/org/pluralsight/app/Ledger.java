package org.pluralsight.app;

import org.pluralsight.io.FileManager;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;

public class Ledger {
    private final FileManager fileManager;
    private final ArrayList<Transaction> ledger;
    private static final int DATE = 0;
    private static final int TIME = 1;
    private static final int DESCRIPTION = 2;
    private static final int VENDOR = 3;
    private static final int AMOUNT = 4;

    public Ledger() {
        ledger = new ArrayList<>();
        fileManager = new FileManager("transactions.csv");
        boolean fileCreated = fileManager.create();

        if (!fileCreated) load();
    }

    /*-----Methods-----*/
    public void post(LocalDateTime timeStamp, String description, String vendor, double amount) {
        Transaction transaction = new Transaction(timeStamp, description, vendor, amount);
        ledger.add(transaction);
        fileManager.write(transaction);
    }

    public void load() {
        String file = fileManager.read();

        if (file.isEmpty()) return;

        String[] transactions = file.split("\n");

        for (String transaction : transactions) {
            String[] token = transaction.split("\\|");

            ledger.add(new Transaction(
                    LocalDate.parse(token[DATE]).atTime(LocalTime.parse(token[TIME])),
                    token[DESCRIPTION],
                    token[VENDOR],
                    Double.parseDouble(token[AMOUNT])
            ));
        }
    }

    public ArrayList<Transaction> transactions() {
        return ledger;
    }
}
