package org.pluralsight.io;

import org.pluralsight.app.Transaction;

import java.io.*;
import java.util.List;

public class FileManager {
    private final String file;

    public FileManager(String file) {
        this.file = file;
    }

    /*-----Methods-----*/
    public String read() {
        StringBuilder contents = new StringBuilder();
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(file))) {
            String line;

            while ((line = bufferedReader.readLine()) != null)
                contents.append(line);

        } catch (IOException e) {
            System.out.println("Could Not Read From File: " + file);
        }
        return contents.toString();
    }

    public void write(List<Transaction> transactions) {
        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file))) {

            for (Transaction transaction : transactions)
                bufferedWriter.write(mapToCSV(transaction));

        } catch (IOException e) {
            System.out.println("Could Not Write To File: " + file);
        }
    }

    public void write(Transaction transaction) {
        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file, true))) {
            bufferedWriter.write(mapToCSV(transaction));
        } catch (IOException e) {
            System.out.println("Could Not Write To File: " + file);
        }
    }

    public boolean create() {
        File fileObj = new File(file);
        try {
            return fileObj.createNewFile();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /*-----Private Methods-----*/
    private String mapToCSV(Transaction transaction) {
        StringBuilder builder = new StringBuilder(transaction.dateString());
        builder.append("|").append(transaction.timeString()).append("|").append(transaction.description());
        builder.append("|").append(transaction.vendor()).append("|").append(transaction.amountString()).append("\n");
        return builder.toString();
    }
}
