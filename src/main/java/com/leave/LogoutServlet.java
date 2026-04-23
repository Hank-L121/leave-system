package com.leave;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 清除 Session，登出使用者
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // 跳回登入頁面
        response.sendRedirect("login.jsp");
    }
}