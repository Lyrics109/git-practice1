<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>
<%
    // 한글 처리
    request.setCharacterEncoding("utf-8");

    // 아이디, 이름을 가져옴
    String memberId = request.getParameter("memberID");
    String name = request.getParameter("name");

    // 1. JDBC 드라이버 로딩
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    int updateCount = 0;
    try {
        String jdbcDriver = "jdbc:mysql://localhost:3306/jsptestdb1?" +
                "useUnicode=true&characterEncoding=utf8";
        String dbUser = "root";
        String dbPass = "1234";

        // 2. DB connection 생성
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

        // 3. Statement 생성
        stmt = conn.createStatement();

        // ex) update MEMBER set NAME = '최범상' where MEMBERID = 'madrius'";
        String updateQuery = "update MEMBER set NAME = '" + name + "' where MEMBERID = '" + memberId + "'";
        // return값은 바뀐 행의 수
        updateCount = stmt.executeUpdate(updateQuery);
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 6. 사용한 Statement 종료
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
        // 7. 커넥션 종료
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
<html>
<body>
<% if (updateCount > 0) { %>
<%= memberId %>의 이름을 <%= name %>(으)로 변경
<% } else { %>
<%= memberId %>의 아이디가 존재하지 않음
<% } %>
</body>
</html>