package com.hospitalsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class prescriptionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name1");
        String date = request.getParameter("date1");
        String age = request.getParameter("age1");
        String prescription = request.getParameter("prescription1");
        
        String status = "Pending";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/clinicdb", "root", "jayesh123456"
            );

            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO prescription (name, date, age, prescription,status) VALUES (?, ?, ?, ?, ?)"
            );

            stmt.setString(1, name);
            stmt.setString(2, date);
            stmt.setString(3, age);
            stmt.setString(4, prescription);
            stmt.setString(5, status);

            stmt.executeUpdate();

            stmt.close();
            conn.close();

            response.sendRedirect("prescription.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database Error: " + e.getMessage());
        }
    }
}
