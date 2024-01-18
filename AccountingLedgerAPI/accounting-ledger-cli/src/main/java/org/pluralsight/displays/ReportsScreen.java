package org.pluralsight.displays;

import org.pluralsight.app.Ledger;
import org.pluralsight.app.Transaction;
import org.pluralsight.io.SimpleIO;
import org.pluralsight.util.Filter;

import java.time.LocalDate;
import java.util.List;

public class ReportsScreen implements Display {
    private final Ledger ledger;

    public ReportsScreen(Ledger ledger) {
        this.ledger = ledger;
    }

    @Override
    public void run() {
        System.out.println();
        System.out.println("""
                ==========[ Reports Screen ]==========
                ======[ Search By Custom Values ]=====
                """);

        LocalDate startDate = optionalDate("Start Date(YYYY-MM-DD): ", LocalDate.MIN).minusDays(1);
        LocalDate endDate = optionalDate("End Date(YYYY-MM-DD): ", LocalDate.MAX).plusDays(1);
        String description = SimpleIO.getLine("Description: ");
        String vendor = SimpleIO.getLine("Vendor: ");
        double minimum = optionalAmount("Minimum Amount: ", -Double.MAX_VALUE);
        double maximum = optionalAmount("Maximum Amount: ", Double.MAX_VALUE);

        List<Transaction> filteredTransactions = Filter.using(ledger.transactions())
                .after(startDate)
                .before(endDate)
                .withDescription(description)
                .withVendor(vendor)
                .withMin(minimum)
                .withMax(maximum).toList();

        print(filteredTransactions);
    }

    public LocalDate optionalDate(String prompt, LocalDate defaultValue) {
        String stringInput = SimpleIO.getLine(prompt);
        return stringInput.isEmpty() ? defaultValue : LocalDate.parse(stringInput);
    }

    public double optionalAmount(String prompt, double defaultValue) {
        String input = SimpleIO.getLine(prompt);
        return input.isEmpty() ? defaultValue : Double.parseDouble(input);
    }

    //TODO - create class to format the data
    private void print(List<Transaction> transactions) {
        for (Transaction transaction : transactions)
            System.out.println(transaction);
    }
}
