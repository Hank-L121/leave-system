<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>登入</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="container">
    <h2>系統登入</h2>
    <% String error = request.getParameter("error"); %>
    <% if ("1".equals(error)) { %>
      <p style="color:red;">帳號或密碼錯誤，請重試。</p>
    <% } %>
    <form action="login" method="post">
      <p>
        <label>帳號</label>
        <input type="text" name="username" required>
      </p>
      <p>
        <label>密碼</label>
        <input type="password" name="password" required>
      </p>
      <p>
        <input type="submit" value="登入">
      </p>
    </form>
  </div>
</body>
</html>