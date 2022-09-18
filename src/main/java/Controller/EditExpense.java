/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Expense;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lasith
 */
@WebServlet(name = "EditExpense", urlPatterns = {"/edit"})
public class EditExpense extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        int id = Integer.valueOf(request.getParameter("expense_id"));
//        RequestDispatcher rd = request.getRequestDispatcher("ViewExpenses.jsp");
//        List<Expense> expense = Expense.find(id);
//        System.out.println(expense);
//        
//        
//        rd.forward(request, response);
        RequestDispatcher rd = request.getRequestDispatcher("ViewExpenses.jsp");
        int id = Integer.valueOf(request.getParameter("expense_id"));
        List<Expense> expense = Expense.find(id);
        List<Expense> expenses = Expense.find("09");
        request.setAttribute("expenses", expenses);
        request.setAttribute("expense", expense);
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.valueOf(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double expected_amount = Double.parseDouble(request.getParameter("expected_amount"));
        double actual_amount = Double.parseDouble(request.getParameter("actual_amount"));
        double difference = Double.parseDouble(request.getParameter("difference"));
        String date = request.getParameter("date");
        String category = request.getParameter("category");

        Expense expense = new Expense(title, description, expected_amount, actual_amount, difference, date, category);
        Expense.update(expense,id);
        
        RequestDispatcher rd = request.getRequestDispatcher("ViewExpenses.jsp");
        List<Expense> expenses = Expense.find("09");
        request.setAttribute("expenses", expenses);
        rd.forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
