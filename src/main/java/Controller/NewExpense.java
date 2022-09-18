/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Expense;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "NewExpense", urlPatterns = {"/new"})
public class NewExpense extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double expected_amount = Double.parseDouble(request.getParameter("expected_amount"));
        double actual_amount = Double.parseDouble(request.getParameter("actual_amount"));
        double difference = Double.parseDouble(request.getParameter("difference"));
        String date = request.getParameter("date");
        String category = request.getParameter("category");

        
        Expense expense = new Expense(title, description, expected_amount, actual_amount, difference, date, category);

        System.out.println(Expense.save(expense));
        
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
