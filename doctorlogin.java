package com.hospitalsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorlogin")
public class doctorlogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/java_online";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "jayesh123456";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String myname = request.getParameter("name1");
        String mypass = request.getParameter("pass1");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

                String sql = "SELECT password FROM doctor WHERE username=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, myname);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String dbPass = rs.getString("password");
                    if (dbPass.equals(mypass)) {
                        // Login successful
                        HttpSession session = request.getSession();
                        session.setAttribute("username", myname);

                        // Redirect to doctorhome.jsp (where your table view is)
                        response.sendRedirect("appointments.jsp");
                        return; // Important to stop further execution
                    }
                }

                request.setAttribute("errorMessage", "Invalid username or password.");
                RequestDispatcher rd = request.getRequestDispatcher("doctorlogin.jsp");
                rd.forward(request, response);



            }
        } catch (Exception e) {
            log("Login error", e); // Log error
            request.setAttribute("errorMessage", "Internal error occurred. Please try again.");
            RequestDispatcher rd = request.getRequestDispatcher("doctorlogin.jsp");
            rd.forward(request, response);
        }
    }
}
