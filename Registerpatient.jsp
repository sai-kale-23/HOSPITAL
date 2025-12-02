<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Patient Registration</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-size: cover;
      background-color: #f3d8e4;
    }

    h3 {
      text-align: center;
      font-size: 2rem;
      padding: 10px;
      margin: 0;
    }

    .box {
      max-width: 600px;
      background-color: rgba(255, 255, 255, 0.95);
      margin: 30px auto;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    .success-message {
      text-align: center;
      background-color: #d4edda;
      color: #155724;
      border: 1px solid #c3e6cb;
      padding: 10px;
      border-radius: 5px;
      margin-bottom: 20px;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    label {
      font-weight: 600;
      margin-bottom: 5px;
    }

    input[type="text"],
    input[type="number"] {
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 16px;
      width: 100%;
    }

    .gender-options {
      display: flex;
      gap: 20px;
      margin-top: 5px;
    }

    .gender-options label {
      font-weight: normal;
    }

    input[type="submit"],
    input[type="reset"] {
      padding: 12px;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
      background-color: #007bff;
      color: white;
      transition: background-color 0.3s ease;
    }

    input[type="reset"] {
      background-color: #6c757d;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
    }

    input[type="reset"]:hover {
      background-color: #5a6268;
    }

    @media screen and (max-width: 640px) {
      .box {
        margin: 20px;
        padding: 20px;
      }

      h3 {
        font-size: 1.5rem;
      }
    }
  </style>
</head>

<body>
  <h3>Patient Registration</h3>
  <div class="box">
    
    <%-- Display success message if present --%>
    <%
      String successMessage = (String) request.getAttribute("successMessage");
      if (successMessage != null) {
    %>
      <div class="success-message"><%= successMessage %></div>
    <%
      }
    %>

    <form action="RegisterpatientServlet" method="post">
      <div>
        <label for="name1">Patient Name:</label>
        <input type="text" id="name1" name="name1" placeholder="Enter your name" required />
      </div>

      <div>
        <label for="age1">Patient Age:</label>
        <input type="number" id="age1" name="age1" placeholder="Enter your age" required />
      </div>

      <div>
        <label for="mob1">Patient Mobile No:</label>
        <input type="number" id="mob1" name="mob1" placeholder="Enter your mobile no" required />
      </div>

      <div>
        <label for="city1">Patient Address:</label>
        <input type="text" id="city1" name="city1" placeholder="Enter your address" required />
      </div>

      <div>
        <label>Gender:</label>
        <div class="gender-options">
          <label><input type="radio" name="gender1" value="Male" required /> Male</label>
          <label><input type="radio" name="gender1" value="Female" required /> Female</label>
          <label><input type="radio" name="gender1" value="Other" required /> Other</label>
        </div>
      </div>

      <div>
        <input type="reset" value="Reset" />
        <input type="submit" value="Submit" />
      </div>
    </form>
  </div>
</body>
</html>
