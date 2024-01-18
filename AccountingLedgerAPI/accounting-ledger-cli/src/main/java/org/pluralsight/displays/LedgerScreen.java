package org.pluralsight.displays;

import org.pluralsight.app.Ledger;
import org.pluralsight.app.Transaction;
import org.pluralsight.io.SimpleIO;
import org.pluralsight.util.Filter;

import java.util.List;

public class LedgerScreen implements Display {
    private final Ledger ledger;

    public LedgerScreen(Ledger ledger) {
        this.ledger = ledger;
    }

    @Override
    public void run() {
        while (true) {
            System.out.println("""
                ==========[ Ledger Screen ]==========
                (1) - Display All Entries
                (2) - Display Only Deposits
                (3) - Display Only Payments
                (4) - Reports Screen
                (5) - Go To Home Screen
                """);

            int input = SimpleIO.getInt("Type In Command: ");

            switch (input) {
                case 1 -> print(ledger.transactions());
                case 2 -> print(Filter.using(ledger.transactions()).onlyDeposits().toList());
                case 3 -> print(Filter.using(ledger.transactions()).onlyPayments().toList());
                case 4 -> System.out.println("reports screen");
                case 5 -> { return; }
                default -> System.out.println("Sorry, " + input + " Is Not A Valid Command. Please Try Again");
            }
        }
    }

    //TODO - create class to format the data
    private void print(List<Transaction> transactions) {
        for (Transaction transaction : transactions)
            System.out.println(transaction);
    }
}
