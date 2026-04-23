# 請假傳簽系統 Leave Approval System

> 使用 Java Servlet + JSP + Maven + Tomcat 開發的企業內部請假流程管理系統

---

## 📋 專案簡介

本專案為模擬企業內部請假傳簽流程所開發的 Web 應用系統，實作員工請假申請與主管線上審核功能，涵蓋角色權限控管、Session 管理、表單資料處理等企業系統常見需求。

---

## ✨ 功能說明

| 功能 | 說明 |
|------|------|
| 員工登入 | 員工使用帳號密碼登入系統 |
| 請假申請 | 填寫假別、日期、原因並送出申請 |
| 申請成功通知 | 送出後顯示申請成功頁面 |
| 我的請假紀錄 | 員工可查看自己的申請狀態 |
| 主管登入 | 主管使用不同帳號登入 |
| 審核清單 | 主管查看所有待審申請 |
| 核准 / 退回 | 主管對每筆申請進行審核操作 |
| 登出功能 | 清除 Session，安全登出 |

---

## 🛠️ 使用技術

| 技術 | 用途 |
|------|------|
| Java 21 | 後端程式語言 |
| Jakarta Servlet | 處理 HTTP 請求與業務邏輯 |
| JSP | 動態網頁畫面呈現 |
| HTML / CSS | 前端介面設計 |
| Maven | 專案管理與打包工具 |
| Apache Tomcat 10.1 | Web 應用伺服器 |

---

## 🏗️ 系統架構

```
使用者瀏覽器
     │
     ▼
Apache Tomcat（Web 伺服器）
     │
     ├── JSP（畫面層）
     │    ├── login.jsp        登入頁面
     │    ├── index.jsp        請假申請單
     │    ├── success.jsp      申請成功頁面
     │    ├── myleave.jsp      我的請假紀錄
     │    └── list.jsp         主管審核清單
     │
     └── Servlet（業務邏輯層）
          ├── LoginServlet     處理登入驗證
          ├── LogoutServlet    處理登出
          ├── LeaveServlet     處理請假申請
          └── ApproveServlet   處理審核結果
```

---

## 🔄 系統流程

```
員工登入
   │
   ▼
填寫請假申請單
   │
   ▼
LeaveServlet 接收資料並儲存
   │
   ▼
申請成功頁面（等待審核）
   │
   ▼
主管登入 → 審核清單
   │
   ├── 核准 → 狀態更新為 ✅ 已核准
   └── 退回 → 狀態更新為 ❌ 已退回
         │
         ▼
員工登入 → 我的請假紀錄（查看審核結果）
```

---

## 📁 專案結構

```
leave-system/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/leave/
│       │       ├── LoginServlet.java      登入邏輯
│       │       ├── LogoutServlet.java     登出邏輯
│       │       ├── LeaveServlet.java      請假申請邏輯
│       │       └── ApproveServlet.java    審核邏輯
│       └── webapp/
│           ├── login.jsp                  登入頁面
│           ├── index.jsp                  申請單頁面
│           ├── success.jsp                申請成功頁面
│           ├── myleave.jsp                個人紀錄頁面
│           ├── list.jsp                   審核清單頁面
│           ├── style.css                  介面樣式
│           └── WEB-INF/
│               └── web.xml
└── pom.xml                                Maven 設定檔
```

---

## 🚀 安裝與執行

### 環境需求
- JDK 21
- Apache Maven 3.9+
- Apache Tomcat 10.1

### 執行步驟

**1. 下載專案**
```bash
git clone https://github.com/你的帳號/leave-system.git
cd leave-system
```

**2. 打包專案**
```bash
mvn package
```

**3. 部署到 Tomcat**

將 `target/leave-system.war` 複製到 Tomcat 的 `webapps/` 資料夾

**4. 啟動 Tomcat 並開啟瀏覽器**
```
http://localhost:8080/leave-system
```

---

## 🔑 測試帳號

| 角色 | 帳號 | 密碼 |
|------|------|------|
| 員工 | employee | 1234 |
| 主管 | manager | 1234 |

---

## 💡 技術重點說明

**Servlet 與 JSP 職責分離**
Servlet 負責業務邏輯（接收資料、判斷、跳轉），JSP 負責畫面呈現，符合 MVC 設計概念，方便日後維護與擴充。

**Session 管理**
使用者登入後以 Session 儲存身份與角色，每個頁面進入時皆驗證 Session，未登入自動導向登入頁，主管頁面限主管角色存取。

**角色權限控管**
系統區分 `employee`（員工）與 `manager`（主管）兩種角色，員工只能申請與查看自己的紀錄，主管才能進入審核清單。

**Maven 打包部署**
使用 Maven 將專案打包成 WAR 檔部署至 Tomcat，符合企業實際部署流程。

---

## 📌 未來規劃

- [ ] 連接 MySQL 資料庫，實現資料持久化（目前暫存於記憶體）
- [ ] 新增 ERP 系統整合介面
- [ ] 加入 Email 通知功能，審核完成自動通知申請人
- [ ] 支援多層級審核流程

---

## 👨‍💻 開發者

李柏翰 LEE PO HAN
