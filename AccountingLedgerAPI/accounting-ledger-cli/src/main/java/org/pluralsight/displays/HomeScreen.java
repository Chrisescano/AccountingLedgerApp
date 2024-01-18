package org.pluralsight.displays;

import org.pluralsight.app.Ledger;
import org.pluralsight.io.SimpleIO;

public class HomeScreen implements Display {
    private final TransactionScreen transactionScreen;
    private final LedgerScreen ledgerScreen;

    public HomeScreen() {
        Ledger ledger = new Ledger();
        transactionScreen = new TransactionScreen(ledger);
        ledgerScreen = new LedgerScreen(ledger);
    }
    @Override
    public void run() {
        while (true) {
            System.out.println("""
                ==========[ HOME SCREEN ]==========
                (D) - Add Deposit
                (P) - Make Payment
                (L) - Ledger
                (X) - Exit
                """);

            char input = SimpleIO.getChar("Type In Command: ");

            switch (input) {
                case 'D' -> {
                    transactionScreen.transactionType(TransactionScreen.DEPOSIT);
                    transactionScreen.run();
                }
                case 'P' -> {
                    transactionScreen.transactionType(TransactionScreen.PAYMENT);
                    transactionScreen.run();
                }
                case 'L' -> ledgerScreen.run();
                case 'X' -> { return; }
                default -> System.out.println("Sorry, " + input + " Is Not A Valid Command. Try Again");
            }
        }
    }
}
