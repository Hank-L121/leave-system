<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.leave.LeaveServlet" %>
<%
  String role = (String) session.getAttribute("role");
  if (role == null) {
    response.sendRedirect("login.jsp");
    return;
  }
  String currentUser = (String) session.getAttribute("user");
%>
<html>
<head>
  <meta charset="UTF-8">
  <title>我的請假紀錄</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="container" style="max-width: 900px;">
    <h2>我的請假紀錄</h2>
    <a href="index.jsp">← 回到申請單</a>
    | <a href="logout">登出</a>
    <br><br>
    <table>
      <tr>
        <th>假別</th>
        <th>開始日期</th>
        <th>結束日期</th>
        <th>原因</th>
        <th>狀態</th>
      </tr>
      <%
        List<Map<String, String>> list = LeaveServlet.leaveList;
        boolean hasRecord = false;
        for (int i = 0; i < list.size(); i++) {
          Map<String, String> leave = list.get(i);
          if (currentUser.equals(leave.get("username"))) {
            hasRecord = true;
      %>
      <tr>
        <td><%= leave.get("leaveType") %></td>
        <td><%= leave.get("startDate") %></td>
        <td><%= leave.get("endDate") %></td>
        <td><%= leave.get("reason") %></td>
        <td><%= leave.get("status") %></td>
      </tr>
      <% } } %>
      <% if (!hasRecord) { %>
      <tr>
        <td colspan="5" style="text-align:center;">目前沒有請假紀錄</td>
      </tr>
      <% } %>
    </table>
  </div>
</body>
</html>