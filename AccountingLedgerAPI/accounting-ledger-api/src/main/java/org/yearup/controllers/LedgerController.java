package org.yearup.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.yearup.data.TransactionDao;
import org.yearup.data.UserDao;
import org.yearup.models.Transaction;
import org.yearup.models.User;

import java.security.Principal;
import java.util.List;

@CrossOrigin
@RestController
@PreAuthorize("isAuthenticated()")
@RequestMapping("ledger")
public class LedgerController {
    UserDao userDao;
    TransactionDao transactionDao;

    @Autowired
    public LedgerController(UserDao userDao, TransactionDao transactionDao) {
        this.userDao = userDao;
        this.transactionDao = transactionDao;
    }

    @GetMapping()
    public List<Transaction> getAllTransactions(Principal principal) {
        String userName = principal.getName();
        User user = userDao.getByUserName(userName);
        int userId = user.getId();

        return transactionDao.getAll(userId);
    }
}
