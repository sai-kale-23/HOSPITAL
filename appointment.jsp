<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Book Appointment</title>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"/>
  <style>
    /* Reset some default */
    * {
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background: #f0f4f8; /* Light blueish background */
      margin: 0;
      padding: 20px;
      color: #333;
    }

    h1 {
      text-align: center;
      color: #004d99;
      margin-bottom: 30px;
    }

    .container {
      max-width: 600px;
      background: #ffffff;
      padding: 25px 30px;
      margin: 0 auto;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    h3 {
      color: #004d99;
      margin-bottom: 15px;
      border-bottom: 2px solid #004d99;
      padding-bottom: 5px;
    }

    form label {
      display: block;
      margin: 12px 0 6px;
      font-weight: 600;
    }

    form input[type="text"],
    form input[type="email"],
    form input[type="tel"],
    form select {
      width: 100%;
      padding: 10px 12px;
      border: 1.5px solid #ccc;
      border-radius: 5px;
      font-size: 1rem;
      transition: border-color 0.3s;
    }

    form input[type="text"]:focus,
    form input[type="email"]:focus,
    form input[type="tel"]:focus,
    form select:focus {
      border-color: #004d99;
      outline: none;
    }

    .gender-options {
      margin-top: 6px;
      display: flex;
      gap: 15px;
      flex-wrap: wrap;
    }

    .gender-options label {
      font-weight: normal;
      cursor: pointer;
    }

    .gender-options input[type="radio"] {
      margin-right: 6px;
      cursor: pointer;
    }

    .form-buttons {
      margin-top: 25px;
      display: flex;
      justify-content: flex-end;
      gap: 10px;
    }

    .form-buttons input[type="submit"],
    .form-buttons input[type="reset"] {
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      font-weight: 700;
      font-size: 1rem;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .form-buttons input[type="submit"] {
      background-color: #004d99;
      color: white;
    }

    .form-buttons input[type="submit"]:hover {
      background-color: #003366;
    }

    .form-buttons input[type="reset"] {
      background-color: #ccc;
      color: #333;
    }

    .form-buttons input[type="reset"]:hover {
      background-color: #999;
      color: white;
    }

    /* Responsive Mobile View */
    @media (max-width: 600px) {
      body {
        padding: 10px;
      }
      .container {
        padding: 20px 15px;
      }

      .form-buttons {
        flex-direction: column;
        align-items: stretch;
      }

      .form-buttons input[type="submit"],
      .form-buttons input[type="reset"] {
        width: 100%;
        margin-bottom: 10px;
      }
    }
  </style>
</head>
<body>

  <h1>Book Appointment</h1>

  <div class="container">
    <h3>Patient Information</h3>

    <form action="AppointmentServlet" method="post">
      <label for="name1">Full Name:</label>
      <input type="text" id="name1" name="name1" required />

      <label for="dobDate">Date of Birth:</label>
      <input type="text" id="dobDate" name="date" placeholder="DD-MM-YYYY" required />

      <label for="mob1">Phone Number:</label>
      <input type="tel" id="mob1" name="mob1" required />

      <label for="email1">Email Address:</label>
      <input type="email" id="email1" name="email1" required />

      <label for="city1">Address:</label>
      <input type="text" id="city1" name="city1" required />

      <label>Gender:</label>
      <div class="gender-options">
        <label><input type="radio" name="gender1" value="Male" required /> Male</label>
        <label><input type="radio" name="gender1" value="Female" /> Female</label>
        <label><input type="radio" name="gender1" value="Other" /> Other</label>
      </div>

      <h3>Appointment Details</h3>

      <label for="doctor1">Preferred Doctor:</label>
      <select name="doctor1" id="doctor1" required>
        <option value="">Select Doctor</option>
        <option value="Dr. Yogesh Turkane">Dr. Yogesh Turkane</option>
      </select>

      <label for="visit1">Reason for Visit:</label>
      <select name="visit1" id="visit1" required>
        <option value="">Select Reason</option>
        <option value="General Checkup">General Checkup</option>
        <option value="Follow-up">Follow-up</option>
        <option value="New Symptoms">New Symptoms</option>
        <option value="Chronic Condition Management">Chronic Condition Management</option>
        <option value="Other">Other</option>
      </select>

      <label for="appointmentDate">Preferred Date of Appointment:</label>
      <input type="text" id="appointmentDate" name="date1" placeholder="DD-MM-YYYY" required />

      <label for="time1">Preferred Time Slot:</label>
      <select name="time1" id="time1" required>
        <option value="Morning">Morning (8 AM to 12 PM)</option>
        <option value="Afternoon">Afternoon (12 PM to 4 PM)</option>
        <option value="Evening">Evening (4 PM to 9 PM)</option>
      </select>

      <div class="form-buttons">
        <input type="reset" value="Clear" />
        <input type="submit" value="Submit" />
      </div>
    </form>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  <script>
    flatpickr("#dobDate", { dateFormat: "d-m-Y" });
    flatpickr("#appointmentDate", { dateFormat: "d-m-Y" });
  </script>

</body>
</html>
