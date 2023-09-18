<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.lang.Exception" %>
<%@ page import="java.sql.*" %>
<%
    // 한글 처리
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String nickname = request.getParameter("nickname");
    String email = request.getParameter("email");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String hobby = request.getParameter("hobby");

    // 1. JDBC 드라이버 로딩
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int updateCount = 0;
    try {
        String jdbcDriver = "jdbc:mysql://localhost:3306/jsptestdb1?" +
                "useUnicode=true&characterEncoding=utf8";
        String dbUser = "root";
        String dbPass = "1234";
        // 2. DB connection 생성
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

        String updateQuery = "update MEMBER2 set id=?, nickname=?, email=?, address=?, hobby=? where id = ? ";
        // 3. PreparedStatement 생성
        pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, id);
        pstmt.setString(2, nickname);
        pstmt.setString(3, email);
        pstmt.setString(4, address1 + " " + address2);
        pstmt.setString(5, hobby);

        // return값은 바뀐 행의 수
        updateCount = pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 6. 사용한 Statement 종료
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        // 7. 커넥션 종료
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
<html>
<body>
<% if (updateCount > 0) { %>
회원님의 ID를 <%= id %>(으)로 변경
회원님의 nickname을 <%= nickname %>(으)로 변경
회원님의 email을 <%= email %>(으)로 변경
회원님의 address를 <%= address1 + " " + address2 %>(으)로 변경
회원님의 hobby를 <%= hobby %>(으)로 변경
<% } else { %>
회원님의 아이디가 존재하지 않음
<% } %>
</body>
</html>