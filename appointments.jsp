<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Appointments</title>
    <style>
        /* Styles are unchanged – omitted for brevity */
        /* ... (same CSS you had) ... */
         table {
            border-collapse: collapse;
            width: 100%;
            font-family: Arial, sans-serif;
        }

        th, td {
            border: 1px solid #555;
            padding: 10px 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .navbar {
            display: flex;
            flex-direction: column;
            background-color: #007B8A;
            padding: 10px 20px;
            color: white;
        }

        .navbar-brand h1 {
            margin: 0;
            font-size: 20px;
            color: white;
        }

        .navbar-menu {
            display: flex;
            justify-content: flex-end;
            list-style: none;
            padding: 0;
            margin: 10px 0 0;
            flex-wrap: wrap;
        }

        .navbar-menu li {
            margin-left: 20px;
        }

        .navbar-menu a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 10px 15px;
            transition: background-color 0.3s;
            border-radius: 4px;
        }

        .navbar-menu a:hover {
            background-color: #00bcd4;
        }

        /* --- Mobile View --- */
        @media screen and (max-width: 760px) {
            .navbar {
                align-items: center;
            }

            .navbar-brand h1 {
                font-size: 18px;
                text-align: center;
            }

            .navbar-menu {
                flex-direction: column;
                align-items: center;
                width: 100%;
            }

            .navbar-menu li {
                margin: 10px 0;
            }

            .navbar-menu a {
                display: block;
                width: 100%;
                text-align: center;
                padding: 10px 0;
            }
        }

        /* Action buttons */
        .action-btn {
            padding: 6px 12px;
            margin: 2px 3px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 0.9rem;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .btn-complete {
            background-color: #28a745; /* Green */
            box-shadow: 0 3px 6px rgba(40, 167, 69, 0.4);
        }
        .btn-complete:hover {
            background-color: #218838;
        }

        .btn-pending {
            background-color: #ffc107; /* Amber */
            color: #212529;
            box-shadow: 0 3px 6px rgba(255, 193, 7, 0.4);
        }
        .btn-pending:hover {
            background-color: #e0a800;
            color: white;
        }

        .btn-edit {
            background-color: #007bff; /* Blue */
            box-shadow: 0 3px 6px rgba(0, 123, 255, 0.4);
        }
        .btn-edit:hover {
            background-color: #0069d9;
        }

        .btn-delete {
            background-color: #dc3545; /* Red */
            box-shadow: 0 3px 6px rgba(220, 53, 69, 0.4);
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        
    </style>
</head>
<body>
<nav class="navbar">
    <div class="navbar-brand">
        <h1>Welcome to Dr. Yogesh Turkane</h1>
    </div>
    <ul class="navbar-menu">
        <li><a href="billing.jsp">Billing</a></li>
        <li><a href="prescription.jsp">Prescription</a></li>
        <li><a href="Registerpatients.jsp">View Registered Patients</a></li>
    </ul>
</nav>

<h2>All Appointments</h2>
<table>
    <tr>
        <th>ID</th><th>Name</th><th>DOB</th><th>Phone</th><th>Email</th>
        <th>Address</th><th>Gender</th><th>Doctor</th><th>Reason</th>
        <th>Appointment Date</th><th>Time Slot</th><th>Status</th><th>Actions</th>
    </tr>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/clinicdb", "root", "jayesh123456"
        );

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM appointments");

        while (rs.next()) {
            int id = rs.getInt("id");
            String status = rs.getString("status");
%>
<tr data-id="<%= id %>">
    <td><%= id %></td>
    <td data-field="name"><%= rs.getString("name") %></td>
    <td data-field="dob"><%= rs.getString("dob") %></td>
    <td data-field="phone"><%= rs.getString("phone") %></td>
    <td data-field="email"><%= rs.getString("email") %></td>
    <td data-field="address"><%= rs.getString("address") %></td>
    <td data-field="gender"><%= rs.getString("gender") %></td>
    <td data-field="doctor"><%= rs.getString("doctor") %></td>
    <td data-field="reason"><%= rs.getString("reason") %></td>
    <td data-field="appointment_date"><%= rs.getString("appointment_date") %></td>
    <td data-field="time_slot"><%= rs.getString("time_slot") %></td>
    <td class="status"><%= status %></td>
    <td>
        <!-- Toggle Status -->
        <button class="action-btn <%= status.equalsIgnoreCase("Completed") ? "btn-pending" : "btn-complete" %>"
                onclick="updateStatus(this, '<%= id %>', '<%= status.equalsIgnoreCase("Completed") ? "Pending" : "Completed" %>')"
                title="Toggle Status">
            <%= status.equalsIgnoreCase("Completed") ? "Pending" : "Complete" %>
        </button>

        <!-- Edit / Save Buttons -->
        <button class="action-btn btn-edit" onclick="editRow(this)">Edit</button>
        <button class="action-btn btn-complete btn-save" style="display: none;" onclick="saveRow(this, '<%= id %>')">Save</button>

        <!-- Delete -->
        <button class="action-btn btn-delete"
                onclick="deleteRow('<%= id %>', this)"
                title="Delete Appointment">Delete</button>
    </td>
</tr>
<%
        }
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
</table>

<script>
function updateStatus(button, id, newStatus) {
    const row = button.closest('tr');
    const statusCell = row.querySelector('.status');

    // Update DOM
    statusCell.textContent = newStatus;

    // Update button UI
    if (newStatus === "Completed") {
        button.className = "action-btn btn-pending";
        button.textContent = "Pending";
        button.setAttribute("onclick", `updateStatus(this, '${id}', 'Pending')`);
    } else {
        button.className = "action-btn btn-complete";
        button.textContent = "Complete";
        button.setAttribute("onclick", `updateStatus(this, '${id}', 'Completed')`);
    }

    // Update in DB via servlet
    fetch(`UpdateStatusServlet?id=${id}&status=${newStatus}`, {
        method: 'GET'
    }).then(res => {
        if (!res.ok) {
            alert("Failed to update status.");
        }
    }).catch(err => {
        alert("Error updating status.");
        console.error(err);
    });
}

function editRow(button) {
    const row = button.closest('tr');
    const fields = row.querySelectorAll('td[data-field]');

    fields.forEach(td => {
        const value = td.textContent.trim();
        td.innerHTML = `<input type="text" value="${value}" style="width: 100%;">`;
    });

    row.querySelector('.btn-edit').style.display = 'none';
    row.querySelector('.btn-save').style.display = 'inline-block';
}

function saveRow(button, id) {
    const row = button.closest('tr');
    const inputs = row.querySelectorAll('td[data-field] input');
    const updatedData = {};

    inputs.forEach(input => {
        const field = input.parentElement.getAttribute('data-field');
        updatedData[field] = input.value.trim();
    });

    fetch(`UpdatePatientServlet`, {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({id, ...updatedData})
    })
    .then(response => response.text())
    .then(data => {
        // Replace inputs with text
        inputs.forEach(input => {
            input.parentElement.textContent = input.value;
        });
        row.querySelector('.btn-edit').style.display = 'inline-block';
        row.querySelector('.btn-save').style.display = 'none';
        alert("Appointment updated successfully.");
    })
    .catch(err => {
        alert("Update failed.");
        console.error(err);
    });
}

function deleteRow(id, btn) {
    if (!confirm("Are you sure you want to delete this appointment?")) return;

    fetch(`DeleteAppointmentServlet?id=${id}`, {
        method: 'GET'
    })
    .then(res => res.text())
    .then(response => {
        btn.closest('tr').remove();
        alert("Appointment deleted successfully.");
    })
    .catch(err => {
        alert("Failed to delete appointment.");
        console.error(err);
    });
}
</script>

</body>
</html>
