package com.hospitalsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class RegisterpatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name1");
        String age = request.getParameter("age1");
        String phone = request.getParameter("mob1");
        String address = request.getParameter("city1");
        String gender = request.getParameter("gender1");
        String status = "Pending";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/clinicdb", "root", "jayesh123456"
            );

            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO patients (name, age, phone,  address, gender, status) VALUES (?, ?, ?, ?, ?, ?)"
            );

            stmt.setString(1, name);
            stmt.setString(2, age);
            stmt.setString(3, phone);
            stmt.setString(4, address);
            stmt.setString(5, gender);
            stmt.setString(6, status);

            stmt.executeUpdate();

            stmt.close();
            conn.close();

            response.sendRedirect("Registerpatient.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database Error: " + e.getMessage());
        }
    }
}
