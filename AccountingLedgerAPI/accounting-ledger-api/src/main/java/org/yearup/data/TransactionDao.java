package org.yearup.data;

import org.yearup.models.Transaction;

import java.util.List;

public interface TransactionDao {
    Transaction getById(int id);
    List<Transaction> getAll(int userId);
    Transaction addTransaction(Transaction transaction);
}
