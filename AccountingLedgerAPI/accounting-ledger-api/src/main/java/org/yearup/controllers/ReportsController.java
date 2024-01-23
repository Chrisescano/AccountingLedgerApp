package org.yearup.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.yearup.data.TransactionDao;
import org.yearup.data.UserDao;
import org.yearup.models.Transaction;
import org.yearup.models.User;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("reports")
@PreAuthorize("isAuthenticated()")
public class ReportsController {
    UserDao userDao;
    TransactionDao transactionDao;

    @Autowired
    public ReportsController(UserDao userDao, TransactionDao transactionDao) {
        this.userDao = userDao;
        this.transactionDao = transactionDao;
    }

    @GetMapping("month-to-date")
    public List<Transaction> monthToDate(Principal principal) {
        String userName = principal.getName();
        User user = userDao.getByUserName(userName);
        int userId = user.getId();

        LocalDate beginningOfMonth = LocalDate.of(LocalDate.now().getYear(), LocalDate.now().getMonth().getValue(),
                1).minusDays(1);

        return transactionDao
                .getAll(userId)
                .stream()
                .filter(transaction -> transaction.getDate().isAfter(beginningOfMonth)).toList();
    }

    @GetMapping("previous-month")
    public List<Transaction> previousMonth(Principal principal) {
        String userName = principal.getName();
        User user = userDao.getByUserName(userName);
        int userId = user.getId();

        LocalDate beginningOfMonth = LocalDate.of(LocalDate.now().getYear(), LocalDate.now().getMonth().getValue(),
                1);
        LocalDate endOfMonth = beginningOfMonth.minusMonths(1).minusDays(1);

        return transactionDao
                .getAll(userId)
                .stream()
                .filter(transaction -> transaction.getDate().isAfter(beginningOfMonth))
                .filter(transaction -> transaction.getDate().isBefore(endOfMonth)).toList();
    }

    @GetMapping("year-to-date")
    public List<Transaction> yearToDate(Principal principal) {
        String userName = principal.getName();
        User user = userDao.getByUserName(userName);
        int userId = user.getId();

        LocalDate beginningOfYear = LocalDate.of(LocalDate.now().getYear(), 1, 1).minusDays(1);

        return transactionDao
                .getAll(userId)
                .stream()
                .filter(transaction -> transaction.getDate().isAfter(beginningOfYear)).toList();
    }

    @GetMapping("previous-year")
    public List<Transaction> previousYear(Principal principal) {
        String userName = principal.getName();
        User user = userDao.getByUserName(userName);
        int userId = user.getId();

        LocalDate beginningOfYear = LocalDate.of(LocalDate.now().getYear(), 1, 1);
        LocalDate endOfYear = beginningOfYear.minusYears(1).minusDays(1);

        return transactionDao
                .getAll(userId)
                .stream()
                .filter(transaction -> transaction.getDate().isAfter(beginningOfYear))
                .filter(transaction -> transaction.getDate().isBefore(endOfYear)).toList();
    }

    @GetMapping()
    public List<Transaction> byVendor(
            @RequestParam(name = "vendor", required = true) String vendor,
            Principal principal
    ) {
        String userName = principal.getName();
        User user = userDao.getByUserName(userName);
        int userId = user.getId();

        return transactionDao
                .getAll(userId)
                .stream()
                .filter(transaction -> transaction.getVendor().contains(vendor)).toList();
    }
}
