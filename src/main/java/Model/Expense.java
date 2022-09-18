/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Database.Database;

/**
 *
 * @author Lasith
 */
public class Expense {

    public Expense(String title, String description, double expected_amount, double actual_amount, double difference, String date, String category) {

        this.title = title;
        this.description = description;
        this.expected_amount = expected_amount;
        this.actual_amount = actual_amount;
        this.difference = difference;
        this.date = date;
        this.category = category;
    }

    public Expense() {
    }

    private int id;
    private String title;
    private String description;
    private double expected_amount;
    private double actual_amount;
    private double difference;
    private String date;
    private String category;

    private static final String FIND_ALL_BY_MONTH = "SELECT * FROM `expense` WHERE date LIKE ?;";
    private static final String FIND_ONE = "SELECT * FROM `expense` WHERE id = ?;";
    private static final String SEARCH_EXPENSE = "SELECT * FROM `expense` WHERE title LIKE ?";
    private static final String UPDATE_EXPENSE = "UPDATE `expense` SET `title`= ? ,`description`= ?,`expected_amount`= ?,`actual_amount`= ?,`difference`= ?,`date`= ?,`category`= ? WHERE id= ?";
    private static final String INSERT_EXPENSE = "INSERT INTO `expense` VALUES (?,?,?,?,?,?,?,?)";
    private static final String DELETE_EXPENSE = "DELETE FROM `expense` WHERE id = ?";

    public static List<Expense> find(String month) {

        List<Expense> expenses = new ArrayList<Expense>();

        try (Connection con = Database.getConnection()) {
            PreparedStatement findAll = con.prepareStatement(FIND_ALL_BY_MONTH);
            findAll.setString(1, "2022-" + month + "-%");
            ResultSet resultSet = findAll.executeQuery();

            while (resultSet.next()) {
                Expense expense = new Expense();
                expense.setId(resultSet.getInt("id"));
                System.out.println(resultSet.getInt("id"));
                expense.setTitle(resultSet.getString("title"));
                expense.setDescription(resultSet.getString("description"));
                expense.setExpectedAmount(resultSet.getDouble("expected_amount"));
                expense.setActualAmount(resultSet.getDouble("actual_amount"));
                expense.setDifference(resultSet.getDouble("difference"));
                expense.setDate(resultSet.getString("date"));
                expense.setCategory(resultSet.getString("category"));
                expenses.add(expense);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return expenses;

    }

    public static List<Expense> find(int id) {

        List<Expense> expenses = new ArrayList<Expense>();

        try (Connection con = Database.getConnection()) {
            PreparedStatement findOne = con.prepareStatement(FIND_ONE);
            findOne.setInt(1, id);
            ResultSet resultSet = findOne.executeQuery();

            while (resultSet.next()) {
                Expense expense = new Expense();
                expense.setId(resultSet.getInt("id"));
                System.out.println(resultSet.getInt("id"));
                expense.setTitle(resultSet.getString("title"));
                expense.setDescription(resultSet.getString("description"));
                expense.setExpectedAmount(resultSet.getDouble("expected_amount"));
                expense.setActualAmount(resultSet.getDouble("actual_amount"));
                expense.setDifference(resultSet.getDouble("difference"));
                expense.setDate(resultSet.getString("date"));
                expense.setCategory(resultSet.getString("category"));
                expenses.add(expense);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return expenses;

    }

    public static int save(Expense expense) {
        try (Connection con = Database.getConnection()) {
            PreparedStatement newExpense = con.prepareStatement(INSERT_EXPENSE);

            newExpense.setString(1, null);
            newExpense.setString(2, expense.getTitle());
            newExpense.setString(3, expense.getDescription());
            newExpense.setDouble(4, expense.getExpectedAmount());
            newExpense.setDouble(5, expense.getActualAmount());
            newExpense.setDouble(6, expense.getDifference());
            newExpense.setString(7, expense.getDate());
            newExpense.setString(8, expense.getCategory());

            if (newExpense.executeUpdate() > 0) {
                return 1;
            } else {
                return 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static int update(Expense expense, int id) {
        try (Connection con = Database.getConnection()) {
            PreparedStatement updateExpense = con.prepareStatement(UPDATE_EXPENSE);
            updateExpense.setString(1, expense.getTitle());
            updateExpense.setString(2, expense.getDescription());
            updateExpense.setDouble(3, expense.getExpectedAmount());
            updateExpense.setDouble(4, expense.getActualAmount());
            updateExpense.setDouble(5, expense.getDifference());
            updateExpense.setString(6, expense.getDate());
            updateExpense.setString(7, expense.getCategory());
            updateExpense.setInt(8, id);

            if (updateExpense.executeUpdate() > 0) {
                return 1;
            } else {
                return 0;

            }

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static int remove(int expense_id) {
        try (Connection con = Database.getConnection()) {
            PreparedStatement removeExpense = con.prepareStatement(DELETE_EXPENSE);
            removeExpense.setInt(1, expense_id);
            if (removeExpense.executeUpdate() > 0) {
                return 1;
            } else {
                return 1;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getExpectedAmount() {
        return expected_amount;
    }

    public void setExpectedAmount(double expected_amount) {
        this.expected_amount = expected_amount;
    }

    public double getActualAmount() {
        return actual_amount;
    }

    public void setActualAmount(double actual_amount) {
        this.actual_amount = actual_amount;
    }

    public double getDifference() {
        return difference;
    }

    public void setDifference(double difference) {
        this.difference = difference;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

}
