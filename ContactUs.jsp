<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Contact Us</title>
   <style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #007BFF, #00c6ff);
    color: #333;
    margin: 0;
    padding: 40px;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
    box-sizing: border-box;
  }

  .contact-card {
    background: white;
    padding: 30px 40px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    max-width: 400px;
    width: 100%;
    box-sizing: border-box;
  }

  h1 {
    margin-bottom: 25px;
    color: #007BFF;
    font-size: 29px;
    text-align: center;
  }

  .contact-item {
    margin-bottom: 18px;
    font-size: 18px;
    line-height: 1.5;
    word-wrap: break-word;
  }

  .contact-label {
    font-weight: 600;
    color: #555;
    display: inline-block;
    min-width: 90px;
  }

  a {
    color: #007BFF;
    text-decoration: none;
    word-break: break-all;
  }

  a:hover {
    text-decoration: underline;
  }

  /* ✅ Mobile View */
  @media (max-width: 480px) {
    body {
      padding: 20px;
      align-items: flex-start;
    }

    .contact-card {
      padding: 20px;
    }

    h1 {
      font-size: 24px;
    }

    .contact-item {
      font-size: 16px;
    }

    .contact-label {
      min-width: 80px;
      font-size: 15px;
    }
  }
</style>
   
</head>

<body>

    <div class="contact-card">
        <h1>Contact Us</h1>
        <div class="contact-item">
        <span class="contact-label">Hospital:</span>DR.Turkane Clinic <br><br>
            <span class="contact-label">Location:</span> Pimapalwadi, Shirdi
        </div>

        <div class="contact-item">
            <span class="contact-label">Name:</span> DR.Yogesh Turkane
        </div>
        <div class="contact-item">
            <span class="contact-label">Email:</span> <a href="mailto:dryogesh@gmail.com">dryogesh@gmail.com</a>
        </div>
        <div class="contact-item">
            <span class="contact-label">Instagram:</span> <a href="https://instagram.com/dr.yogiturkane"
                target="_blank">@dr.yogiturkane</a>
        </div>
        <div class="contact-item">
            <span class="contact-label">Mobile:</span> <a href="tel:9890629942">9890629942</a>
        </div>
    </div>

</body>

</html>
