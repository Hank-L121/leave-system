<%@ page contentType="text/html; charset=UTF-8" %>
<%
  String role = (String) session.getAttribute("role");
  if (role == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<html>
<head>
  <meta charset="UTF-8">
  <title>請假申請系統</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="container">
    <h2>請假申請單</h2>
    <form action="leave" method="post">
      <p>
        <label>申請人姓名</label>
        <input type="text" name="name" required>
      </p>
      <p>
        <label>請假類型</label>
        <select name="leaveType">
          <option value="年假">年假</option>
          <option value="病假">病假</option>
          <option value="事假">事假</option>
        </select>
      </p>
      <p>
        <label>開始日期</label>
        <input type="date" name="startDate" required>
      </p>
      <p>
        <label>結束日期</label>
        <input type="date" name="endDate" required>
      </p>
      <p>
        <label>請假原因</label>
        <textarea name="reason" rows="4"></textarea>
      </p>
      <p>
        <input type="submit" value="送出申請">
      </p>
    </form>
    <hr>
    <p>登入身份：<%= session.getAttribute("user") %> | <a href="myleave.jsp">我的請假紀錄</a> | <a href="logout">登出</a></p>
    <% if ("manager".equals(role)) { %>
      <p>主管入口：<a href="list.jsp">進入審核清單</a></p>
    <% } %>
  </div>
</body>
</html>