<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ResultSet appointment = (ResultSet) request.getAttribute("appointment");
%>
<html>
<head>
    <title>Edit Appointment</title>
</head>
<body>
    <h2>Edit Appointment</h2>
    <form action="UpdateAppointmentServlet" method="post">
        <input type="hidden" name="id" value="<%= appointment.getInt("id") %>">

        Name: <input type="text" name="name" value="<%= appointment.getString("name") %>"><br><br>
        DOB: <input type="date" name="dob" value="<%= appointment.getString("dob") %>"><br><br>
        Phone: <input type="text" name="phone" value="<%= appointment.getString("phone") %>"><br><br>
        Email: <input type="email" name="email" value="<%= appointment.getString("email") %>"><br><br>
        Address: <input type="text" name="address" value="<%= appointment.getString("address") %>"><br><br>
        Gender: 
        <select name="gender">
            <option value="Male" <%= appointment.getString("gender").equals("Male") ? "selected" : "" %>>Male</option>
            <option value="Female" <%= appointment.getString("gender").equals("Female") ? "selected" : "" %>>Female</option>
        </select><br><br>
        Doctor: <input type="text" name="doctor" value="<%= appointment.getString("doctor") %>"><br><br>
        Reason: <input type="text" name="reason" value="<%= appointment.getString("reason") %>"><br><br>
        Appointment Date: <input type="date" name="appointment_date" value="<%= appointment.getString("appointment_date") %>"><br><br>
        Time Slot: <input type="text" name="time_slot" value="<%= appointment.getString("time_slot") %>"><br><br>
        Status: 
        <select name="status">
            <option value="Pending" <%= appointment.getString("status").equals("Pending") ? "selected" : "" %>>Pending</option>
            <option value="Completed" <%= appointment.getString("status").equals("Completed") ? "selected" : "" %>>Completed</option>
        </select><br><br>

        <input type="submit" value="Update Appointment">
    </form>
</body>
</html>
