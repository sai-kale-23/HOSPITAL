<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Dr. Turkane Clinic</title>
    <style>
        body {
            background-color: rgb(173, 182, 230);
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0 10px;
        }

        .Box {
            margin: 20px auto;
            padding: 16px 20px;
            max-width: 509px;
            border: 4px solid darkblue;
            border-radius: 12px;
            font-size: larger;
            background-image: linear-gradient(#CCFF00, white, #CCFF66);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .Box1 {
            padding: 20px;
            margin: 20px auto;
            max-width: 460px;
            border: 3px solid darkblue;
            border-radius: 8px;
            background-color: white;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
        }

        .patil {
            margin: 20px auto;
            max-width: 440px;
            border: 2px solid darkblue;
            padding: 15px 20px;
            background-color: #eee;
            border-radius: 8px;
        }

        .patil ul {
            padding-left: 20px;
            margin: 0;
            list-style-type: disc;
        }

        .sort,
        .jayesh {
            max-width: 600px;
            margin: 10px auto;
            padding: 10px 15px;
            text-align: center;
            border: 2px solid darkblue;
            border-radius: 6px;
            background-color: #f0f8ff;
            font-weight: 600;
            color: #00008b;
        }

        input[type="text"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            font-size: 16px;
            border: 2px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        textarea:focus {
            border-color: darkblue;
            box-shadow: 0 0 5px rgba(0, 0, 139, 0.5);
            outline: none;
        }

        input[type="submit"],
        button#printBtn {
            font-size: 16px;
            color: white;
            background-color: darkblue;
            padding: 12px 24px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover,
        button#printBtn:hover {
            background-color: #000080;
        }

        h2 {
            text-align: center;
            color: red;
            margin-bottom: 10px;
        }

        h3 {
            text-align: center;
            color: darkblue;
            margin-top: 30px;
        }

        p {
            font-size: 16px;
            line-height: 1.5;
            margin: 10px 0;
        }

        .logo-container {
            text-align: center;
            margin: 10px 0 20px 0;
        }

        img {
            display: block;
            margin: auto;
            border-radius: 50%;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
        }

        /* Hide elements when printing */
        @media print {
            button#printBtn,
            input[type="submit"] {
                display: none;
            }
        }

        /* Responsive */
        @media (max-width: 600px) {
            .Box,
            .Box1,
            .patil,
            .sort,
            .jayesh {
                max-width: 100%;
                width: 100%;
                box-sizing: border-box;
            }
        }
    </style>
</head>

<body>

    <div class="Box">
        <div style="display: flex; justify-content: space-between;">
            <div>Reg No: 65915</div>
            <div>Mobile No: 9890629942</div>
        </div>

        <div class="logo-container">
            <img src="logo.jpeg" alt="Clinic Logo" height="100" width="100">
        </div>

        <h2>DR. Turkane Clinic</h2>
        <p>Dr. Yogesh Turkane<br>B.H.M.S.(M.U.H.S)<br>C.C.H</p>
    </div>

    <h3>Address: Shirdi</h3>

    <div class="Box1">
        <form action="prescriptionServlet" method="post">
            <label>Name:</label>
            <input type="text" name="name1" placeholder="Enter your name" required>

            <label>Date:</label>
            <input type="date" name="date1" required>

            <label>Age:</label>
            <input type="text" name="age1" placeholder="Enter your age" maxlength="4">

            <label>Prescription</label>
            <textarea rows="10" name="prescription1" placeholder="Write prescription here..."></textarea>

            <input type="submit" value="Send Prescription To Medical">
        </form>

        <!-- Print Button -->
        <button id="printBtn" onclick="window.print()">Print / Download Prescription</button>
    </div>

    <div class="patil">
        <h4 style="color: darkblue;">* Available Facilities *</h4>
        <ul>
            <li>Well-equipped inpatient and outpatient department</li>
            <li>Special Room</li>
            <li>Blood And Urine Test Facility</li>
            <li>Nebulization (steam) Facility</li>
            <li>Traction (weight Application) Facility</li>
            <li>Expert Doctor's Visits & Treatment</li>
            <li>Antenatal Check-Up & Treatment</li>
            <li>Thyroid, BP, Sugar Testing & Treatment</li>
        </ul>
    </div>

    <div class="sort">
        Time: Morning 9 AM TO 2 PM | Afternoon 3 PM TO 8 PM | Emergency 24 Hours
    </div>

    <div class="jayesh">
        Sharayu Medical: A Trusted Place To Get All Kinds Of Medicines
    </div>

</body>

</html>
