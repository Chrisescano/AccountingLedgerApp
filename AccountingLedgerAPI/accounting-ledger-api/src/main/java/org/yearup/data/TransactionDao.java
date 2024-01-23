package org.yearup.data;

import org.yearup.models.Transaction;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

public interface TransactionDao {
    Transaction getById(int id);
    List<Transaction> search(LocalDate start, LocalDate end, String description, String vendor, BigDecimal min, BigDecimal max, int userId);
    List<Transaction> getAll(int userId);
    Transaction addTransaction(Transaction transaction);
}
