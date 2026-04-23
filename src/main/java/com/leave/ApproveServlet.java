package com.leave;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.util.*;

@WebServlet("/approve")
public class ApproveServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // 取得是第幾筆申請
        int index = Integer.parseInt(request.getParameter("index"));
        
        // 取得按的是「核准」還是「退回」
        String action = request.getParameter("action");
        
        // 更新那筆申請的狀態
        Map<String, String> leave = LeaveServlet.leaveList.get(index);
        if (action.equals("核准")) {
            leave.put("status", "✅ 已核准");
        } else {
            leave.put("status", "❌ 已退回");
        }
        
        // 跳回審核清單
        response.sendRedirect("list.jsp");
    }
}