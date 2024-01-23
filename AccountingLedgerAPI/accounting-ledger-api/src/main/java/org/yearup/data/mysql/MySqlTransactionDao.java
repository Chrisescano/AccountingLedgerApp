package org.yearup.data.mysql;

import org.springframework.stereotype.Component;
import org.yearup.data.TransactionDao;
import org.yearup.models.Transaction;

import javax.sql.DataSource;
import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Component
public class MySqlTransactionDao extends MySqlDaoBase implements TransactionDao {

    public MySqlTransactionDao(DataSource dataSource) {
        super(dataSource);
    }

    @Override
    public Transaction getById(int id) {
        String sql = "SELECT * FROM transactions WHERE transaction_id = ?;";

        try (Connection connection = getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            ResultSet row = statement.executeQuery();

            if (row.next())
                return mapRow(row);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    @Override
    public List<Transaction> search(LocalDate start, LocalDate end, String description, String vendor, BigDecimal min, BigDecimal max, int userId) {
        List<Transaction> transactions = new ArrayList<>();

        String sql = """
                SELECT * FROM transactions
                WHERE user_id = ?
                AND (date BETWEEN ? AND ?)
                AND (description LIKE ?)
                AND (vendor LIKE ?)
                AND (amount BETWEEN ? AND ?);
                """;

        try(Connection connection = getConnection()){
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1,userId);
            statement.setDate(2, Date.valueOf(start));
            statement.setDate(3, Date.valueOf(end));
            statement.setString(4, description);
            statement.setString(5, vendor);
            statement.setBigDecimal(6, min);
            statement.setBigDecimal(7, max);

            ResultSet row = statement.executeQuery();

            while (row.next()){
                Transaction transaction = mapRow(row);
                transactions.add(transaction);
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return transactions;
    }

    @Override
    public List<Transaction> getAll(int userId) {
        String sql = "SELECT * FROM transactions WHERE user_id = ?;";
        List<Transaction> transactions = new ArrayList<>();

        try (Connection connection = getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet rows = statement.executeQuery();

            while (rows.next()) {
                transactions.add(mapRow(rows));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return transactions;
    }

    @Override
    public Transaction addTransaction(Transaction transaction) {
        String sql = """
                INSERT INTO transactions (user_id, date, time, description, vendor, amount)
                VALUES (?, ?, ?, ?, ?, ?);
                """;

        try (Connection connection = getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setInt(1, transaction.getUserId());
            statement.setDate(2, java.sql.Date.valueOf(transaction.getDate()));
            statement.setTime(3, java.sql.Time.valueOf(transaction.getTime()));
            statement.setString(4, transaction.getDescription());
            statement.setString(5, transaction.getVendor());
            statement.setDouble(6, transaction.getAmount());

            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                ResultSet rows = statement.getGeneratedKeys();

                if (rows.next()) {
                    int transactionId = rows.getInt(1);
                    return getById(transactionId);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    protected static Transaction mapRow(ResultSet row) throws SQLException {
        int transactionId = row.getInt("transaction_id");
        int userId = row.getInt("user_id");
        LocalDate date = row.getDate("date").toLocalDate();
        LocalTime time = row.getTime("time").toLocalTime();
        String description = row.getString("description");
        String vendor = row.getString("vendor");
        double amount = row.getDouble("amount");

        return new Transaction(transactionId, userId, date, time, description, vendor, amount);
    }
}
