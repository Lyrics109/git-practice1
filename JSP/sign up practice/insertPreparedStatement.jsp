<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.lang.Exception" %>
<%@ page import="java.sql.*" %>

<%
    // 한글 처리
    request.setCharacterEncoding("utf-8");

    String nickname = request.getParameter("nickname");
    String email = request.getParameter("email");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String hobby = request.getParameter("hobby");

    // 1. JDBC 드라이버 로딩
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        String jdbcDriver = "jdbc:mysql://localhost:3306/jsptestdb1?" +
                "useUnicode=true&characterEncoding=utf8";
        String dbUser = "root";
        String dbPass = "1234";

        // 2. DB connection 생성
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

        String insertQuery = "insert into MEMBER2(id, nickname, email, address, hobby) values (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(insertQuery);
        pstmt.setString(1, null);
        pstmt.setString(2, nickname);
        pstmt.setString(3, email);
        pstmt.setString(4, address1 + " " + address2);
        pstmt.setString(5, hobby);

        pstmt.executeUpdate(); // 실제 insert문 실행

    } catch (Exception e){
        e.printStackTrace();
    } finally {
        if(pstmt != null) try { pstmt.close();} catch (SQLException ex){}
        if(conn != null) try { conn.close();} catch (SQLException ex){}
    }

%>
회원가입이 되었습니다.