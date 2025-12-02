<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Billing Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(135deg, #dbeafe, #f0f9ff);
      margin: 0;
      padding: 20px;
    }

    h1 {
      text-align: center;
      color: #333;
    }

    .box {
      background-color: #ffffff;
      height: auto;
      width: 500px;
      border: 4px solid #000;
      border-radius: 10px;
      padding: 30px;
      margin: auto;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    }

    label {
      display: block;
      font-size: 16px;
      margin-bottom: 5px;
      font-weight: bold;
    }

    input[type="text"],
    input[type="date"],
    select {
      width: 100%;
      padding: 8px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
    }

    h3 {
      margin-top: 30px;
      margin-bottom: 15px;
      color: #444;
    }

    h2#totalAmount {
      color: green;
      font-weight: bold;
      margin-top: 10px;
    }

    input[type="submit"],
    button#printBtn {
      padding: 10px 20px;
      font-size: 16px;
      background-color: #007BFF;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      margin-top: 10px;
    }

    input[type="submit"]:hover,
    button#printBtn:hover {
      background-color: #0056b3;
    }

    /* Hide buttons when printing */
    @media print {
      button#printBtn,
      input[type="submit"] {
        display: none;
      }
    }
  </style>
</head>
<body>

  <div class="box">
    <form id="billingForm" action="billing" method="post" onsubmit="return calculateTotal()">
      <h1>Billing / Payment</h1>

      <label>Patient Name:</label>
      <input type="text" name="name1" placeholder="Enter your name" required>

      <label>Bill No:</label>
      <input type="text" name="billno" required>

      <label>Admission Date:</label>
      <input type="date" name="adate1" required>

      <label>Discharge Date:</label>
      <input type="date" name="ddate1" required>

      <h3>Itemized Charges</h3>

      <label>Doctor Consultation:</label>
      <input type="text" name="textno1" id="txtf1" maxlength="5" required>

      <label>Room Charges:</label>
      <input type="text" name="textno2" id="txtf2" required>

      <label>Lab Tests:</label>
      <input type="text" name="textno3" id="txtf3" required>

      <label>Medicines:</label>
      <input type="text" name="textno4" id="txtf4" required>

      <label>Total Payable Amount:</label>
      <h2 id="totalAmount">0</h2>

      <label>Payment Status:</label>
      <select name="paid1" required>
        <option value="">--Select--</option>
        <option>Paid</option>
        <option>Pending</option>
      </select>

      <label>Payment Method:</label>
      <select name="payment1" required>
        <option value="">--Select--</option>
        <option>UPI</option>
        <option>Scanner</option>
        <option>Cash</option>
      </select>

      <label>Date:</label>
      <input type="date" name="date1" required>

      <center>
        <input type="submit" value="Submit">
        <button type="button" id="printBtn" onclick="handlePrint()">Print / Download</button>
      </center>
    </form>
  </div>

  <script>
    function calculateTotal() {
      const val1 = parseFloat(document.getElementById("txtf1").value) || 0;
      const val2 = parseFloat(document.getElementById("txtf2").value) || 0;
      const val3 = parseFloat(document.getElementById("txtf3").value) || 0;
      const val4 = parseFloat(document.getElementById("txtf4").value) || 0;

      const total = val1 + val2 + val3 + val4;
      document.getElementById("totalAmount").innerText = total.toFixed(2);

      return true; // Allow form submission
    }

    function handlePrint() {
      calculateTotal(); // Ensure total is updated before printing
      window.print();
    }
  </script>

</body>
</html>
