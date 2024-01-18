package org.pluralsight.displays;

import org.pluralsight.app.Ledger;
import org.pluralsight.io.SimpleIO;

import java.time.LocalDate;
import java.time.LocalTime;

public class TransactionScreen implements Display{
    private final Ledger ledger;
    private String transactionType;

    public static final boolean DEPOSIT = true;
    public static final boolean PAYMENT = false;

    public TransactionScreen(Ledger ledger) {
        this.ledger = ledger;
    }

    @Override
    public void run() {
        System.out.println();
        System.out.println("==========[ " + transactionType + " Screen ]==========");

        LocalDate date = SimpleIO.getDate(transactionType + " Date(YYYY-MM-DD): ");
        LocalTime time = SimpleIO.getTime(transactionType + " Time(HH:MM:SS): ");
        String description = SimpleIO.getLine(transactionType + " Description: ");
        String vendor = SimpleIO.getLine(transactionType + " Vendor: ");
        double amount = SimpleIO.getDouble(transactionType + " Amount: ");

        ledger.post(date.atTime(time), description, vendor, amount);
    }

    public void transactionType(boolean isDeposit) {
        transactionType = isDeposit ? "Deposit" : "Payment";
    }
}
