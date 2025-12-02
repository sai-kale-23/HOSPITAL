<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Login</title>
  <style>
    @property --angle {
      syntax: "<angle>";
      initial-value: 0deg;
      inherits: false;
    }

    body {
      margin: 0;
      padding: 0;
      background: linear-gradient(to right, #dbeafe, #f0fdf4);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .box1 {
      background-color: whitesmoke;
      height: auto;
      width: 400px;
      border: 1px solid white;
      position: relative;
      border-radius: 20px;
      padding: 40px 30px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    .box1::after,
    .box1::before {
      content: '';
      position: absolute;
      height: 100%;
      width: 100%;
      background-image: conic-gradient(from var(--angle), transparent 40%, orange, pink, tomato);
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      z-index: -2;
      padding: 10px;
      border-radius: 20px;
      animation: spin 4s linear infinite;
    }

    .box1::before {
      filter: blur(1.5rem);
      opacity: 0.6;
    }

    @keyframes spin {
      from {
        --angle: 0deg;
      }

      to {
        --angle: 360deg;
      }
    }

    h1 {
      font-family: Verdana, Geneva, Tahoma, sans-serif;
      font-weight: bold;
      font-size: 1.8rem;
      text-align: center;
      color: darkgreen;
      margin-bottom: 30px;
    }

    label {
      font-style: italic;
      font-size: 1.1rem;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-top: 6px;
      margin-bottom: 20px;
      font-size: 1rem;
      font-family: cursive;
      color: darkblue;
      border: 1px solid #ccc;
      border-radius: 6px;
      transition: border-color 0.3s;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
      border-color: #4CAF50;
      outline: none;
    }

    input[type="submit"],
    input[type="reset"] {
      background-color: darkgreen;
      color: white;
      padding: 10px 20px;
      border: none;
      font-size: 1rem;
      border-radius: 6px;
      margin: 0 10px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    input[type="submit"]:hover,
    input[type="reset"]:hover {
      background-color: green;
    }

    center {
      margin-top: 10px;
    }
  </style>
</head>

<body>

  <div class="box1">
    <form action="Admin" method="post">
      <h1>ADMIN LOGIN</h1>
      <label>USERNAME:</label>
      <input type="text" placeholder="Enter username" name="name1" required maxlength="18">

      <label>Password:</label>
      <input type="password" placeholder="Enter password" name="pass1" required maxlength="18">

      <center>
        <input type="reset" value="Clear">
        <input type="submit" value="Login">
      </center>
    </form>
  </div>

</body>

</html>
