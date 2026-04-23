<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.leave.LeaveServlet" %>
<%
  String role = (String) session.getAttribute("role");
  if (role == null) {
    response.sendRedirect("login.jsp");
    return;
  }
  if (!role.equals("manager")) {
    response.sendRedirect("index.jsp");
    return;
  }
%>
<html>
<head>
  <meta charset="UTF-8">
  <title>審核清單</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="container" style="max-width: 900px;">
    <h2>請假審核清單</h2>
    <a href="index.jsp">← 回到申請單</a>
    登入身份：<%= session.getAttribute("user") %> | <a href="logout">登出</a>
    <br><br>
    <table>
      <tr>
        <th>申請人</th>
        <th>假別</th>
        <th>開始日期</th>
        <th>結束日期</th>
        <th>原因</th>
        <th>狀態</th>
        <th>操作</th>
      </tr>
      <% 
        List<Map<String, String>> list = LeaveServlet.leaveList;
        for (int i = 0; i < list.size(); i++) {
          Map<String, String> leave = list.get(i);
      %>
      <tr>
        <td><%= leave.get("name") %></td>
        <td><%= leave.get("leaveType") %></td>
        <td><%= leave.get("startDate") %></td>
        <td><%= leave.get("endDate") %></td>
        <td><%= leave.get("reason") %></td>
        <td><%= leave.get("status") %></td>
        <td>
          <form action="approve" method="post">
            <input type="hidden" name="index" value="<%= i %>">
            <input type="submit" name="action" value="核准">
            <input type="submit" name="action" value="退回">
          </form>
        </td>
      </tr>
      <% } %>
    </table>
  </div>
</body>
</html>