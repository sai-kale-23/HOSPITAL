package com.hospitalsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class AppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name1");
        String dob = request.getParameter("date");
        String phone = request.getParameter("mob1");
        String email = request.getParameter("email1");
        String address = request.getParameter("city1");
        String gender = request.getParameter("gender1");
        String doctor = request.getParameter("doctor1");
        String reason = request.getParameter("visit1");
        String appointmentDate = request.getParameter("date1");
        String time = request.getParameter("time1");
        String status = "Pending";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/clinicdb", "root", "jayesh123456"
            );

            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO appointments (name, dob, phone, email, address, gender, doctor, reason, appointment_date, time_slot, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            );

            stmt.setString(1, name);
            stmt.setString(2, dob);
            stmt.setString(3, phone);
            stmt.setString(4, email);
            stmt.setString(5, address);
            stmt.setString(6, gender);
            stmt.setString(7, doctor);
            stmt.setString(8, reason);
            stmt.setString(9, appointmentDate);
            stmt.setString(10, time);
            stmt.setString(11, status);

            stmt.executeUpdate();

            stmt.close();
            conn.close();

            response.sendRedirect("appointment.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database Error: " + e.getMessage());
        }
    }
}
