package com.hospitalsystem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/billing")
public class billing extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public billing() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String myname = request.getParameter("name1");
        String myadmission = request.getParameter("adate1");
        String mydischarge = request.getParameter("ddate1");
        String myconsultation = request.getParameter("textno1");
        String myroomcharges = request.getParameter("textno2");
        String mylabtest = request.getParameter("textno3");
        String mymedicine = request.getParameter("textno4");
        String mypayment = request.getParameter("paid1");
        String mypaymentmethod = request.getParameter("payment1");
        String mydate = request.getParameter("date1");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "jayesh123456");
                 PreparedStatement ps = con.prepareStatement(
                     "INSERT INTO billing(name, admission, discharge, consultation, roomcharges, lab, medicine, payment, paymentmethod, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {

                ps.setString(1, myname);
                ps.setString(2, myadmission);
                ps.setString(3, mydischarge);
                ps.setString(4, myconsultation);
                ps.setString(5, myroomcharges);
                ps.setString(6, mylabtest);
                ps.setString(7, mymedicine);
                ps.setString(8, mypayment);
                ps.setString(9, mypaymentmethod);
                ps.setString(10, mydate);

                int count = ps.executeUpdate();
                response.setContentType("text/html");

                if (count > 0) {
                    out.print("<h2 style='color:green'>Patient registered successfully</h2>");
                } else {
                    out.print("<h3 style='color:red'>User not registered due to some error</h3>");
                }

                RequestDispatcher rd = request.getRequestDispatcher("/billing.jsp");
                rd.include(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            out.print("<h3 style='color:red'>User not registered due to error: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = request.getRequestDispatcher("/billing.jsp");
            rd.include(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}
