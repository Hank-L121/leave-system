package com.leave;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.util.*;

@WebServlet("/leave")
public class LeaveServlet extends HttpServlet {
    
    // 用來暫存所有請假申請的清單
    public static List<Map<String, String>> leaveList = new ArrayList<>();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 設定編碼，避免中文亂碼
        request.setCharacterEncoding("UTF-8");
        
        // 取得表單送來的資料
        String name = request.getParameter("name");
        String leaveType = request.getParameter("leaveType");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String reason = request.getParameter("reason");
        
        // 把資料存進 Map（類似一筆紀錄）
        Map<String, String> leave = new HashMap<>();
        leave.put("name", name);
        leave.put("username", request.getSession().getAttribute("user").toString());
        leave.put("leaveType", leaveType);
        leave.put("startDate", startDate);
        leave.put("endDate", endDate);
        leave.put("reason", reason);
        leave.put("status", "待審核");
        
        // 把這筆紀錄加進清單
        leaveList.add(leave);
        
        // 跳轉到審核清單頁面
        response.sendRedirect("success.jsp");
    }
}