package com.leave;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 模擬帳號密碼（之後連資料庫時會改掉）
        if (username.equals("employee") && password.equals("1234")) {
            // 員工登入
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            session.setAttribute("role", "employee");
            response.sendRedirect("index.jsp");

        } else if (username.equals("manager") && password.equals("1234")) {
            // 主管登入
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            session.setAttribute("role", "manager");
            response.sendRedirect("list.jsp");

        } else {
            // 帳號密碼錯誤
            response.sendRedirect("login.jsp?error=1");
        }
    }
}