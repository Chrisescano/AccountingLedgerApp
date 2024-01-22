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

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

@CrossOrigin
@RestController
@PreAuthorize("isAuthenticated()")
public class TransactionController {
    private TransactionDao transactionDao;
    private UserDao userDao;

    @Autowired
    public TransactionController(TransactionDao transactionDao, UserDao userDao) {
        this.transactionDao = transactionDao;
        this.userDao = userDao;
    }

    @GetMapping("ledger")
    public List<Transaction> getAllTransactions(Principal principal) {
        String userName = principal.getName();
        User user = userDao.getByUserName(userName);
        int userId = user.getId();

        return transactionDao.getAll(userId);
    }

    @GetMapping("transaction")
    public List<Transaction> customTransactionSearch(
            @RequestParam(name = "start", required = false) LocalDate startDate,
            @RequestParam(name = "end", required = false) LocalDate endDate,
            @RequestParam(name = "description", required = false) String description,
            @RequestParam(name = "vendor", required = false) String vendor,
            @RequestParam(name = "min", required = false) Integer min,
            @RequestParam(name = "max", required = false) Integer max,
            Principal principal
    ) {
        String userName = principal.getName();
        User user = userDao.getByUserName(userName);
        int userId = user.getId();



        return null;
    }

    @PostMapping("transaction")
    public Transaction addTransaction(@RequestBody Transaction transaction) {
        System.out.println(transaction);
        return null;
    }
}


