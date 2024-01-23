package org.yearup.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.yearup.data.ProfileDao;
import org.yearup.data.TransactionDao;
import org.yearup.data.UserDao;
import org.yearup.models.Profile;
import org.yearup.models.Transaction;
import org.yearup.models.User;

import java.math.BigDecimal;
import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.util.List;

@CrossOrigin
@RestController
@PreAuthorize("isAuthenticated()")
@RequestMapping("transaction")
public class TransactionController {
    private TransactionDao transactionDao;
    private UserDao userDao;

    @Autowired
    public TransactionController(TransactionDao transactionDao, UserDao userDao) {
        this.transactionDao = transactionDao;
        this.userDao = userDao;
    }

    @GetMapping()
    public List<Transaction> customTransactionSearch(
            @RequestParam(name = "start", required = false) String startDate,
            @RequestParam(name = "end", required = false) String endDate,
            @RequestParam(name = "description", required = false) String description,
            @RequestParam(name = "vendor", required = false) String vendor,
            @RequestParam(name = "min", required = false) BigDecimal min,
            @RequestParam(name = "max", required = false) BigDecimal max,
            Principal principal
    ) {
        String userName = principal.getName();
        User user = userDao.getByUserName(userName);
        int userId = user.getId();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate start = startDate == null ? LocalDate.of(1000, 1, 1) : LocalDate.parse(startDate, formatter);
        LocalDate end = endDate == null ? LocalDate.of(9999, 12, 31) : LocalDate.parse(endDate, formatter);
        description = description == null ? "%" : "%" + description + "%";
        vendor = vendor == null ? "%" : "%" + vendor + "%";
        min = min == null ? BigDecimal.valueOf(-Double.MAX_VALUE) : min;
        max = max == null ? BigDecimal.valueOf(Double.MAX_VALUE) : max;

        return transactionDao.search(start, end, description, vendor, min, max, userId);
    }

    @GetMapping("deposits")
    public List<Transaction> getDeposits(Principal principal) {
        String userName = principal.getName();
        User user = userDao.getByUserName(userName);
        int userId = user.getId();

        List<Transaction> transactions = transactionDao.getAll(userId);
        return transactions.stream().filter(transaction -> transaction.getAmount() > 0).toList();
    }

    @GetMapping("payments")
    public List<Transaction> getPayments(Principal principal) {
        String userName = principal.getName();
        User user = userDao.getByUserName(userName);
        int userId = user.getId();

        List<Transaction> transactions = transactionDao.getAll(userId);
        return transactions.stream().filter(transaction -> transaction.getAmount() < 0).toList();
    }

    @PostMapping()
    public Transaction addTransaction(@RequestBody Transaction transaction, Principal principal) {
        String userName = principal.getName();
        User user = userDao.getByUserName(userName);
        int userId = user.getId();

        transaction.setUserId(userId);

        return transactionDao.addTransaction(transaction);
    }
}


