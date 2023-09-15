<%@ page contentType = "text/html; charset=utf-8" %>

<html>
<head>
    <title>Member 테이블 레코드 삽입</title>
</head>
<body>
<form action="/webapp1/day3/practice/insertPreparedStatement.jsp" method="post">
  <table border="1">
        <tr>
            <td>닉네임</td>
            <td><input type="text" name="nickname" size="20"></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="text" name="email" size="20"></td>
        </tr>
      <tr>
          <td>주소1</td>
          <td><input type="text" name="address1" size="20"></td>
      </tr>
      <tr>
          <td>주소2</td>
          <td><input type="text" name="address2" size="20"></td>
      </tr>
      <tr colspan="4">
          <td>취미</td>
          <td><input type="checkbox" name="hobby" value="exercise">운동
          <input type="checkbox" name="hobby" value="listen to the music">음악
          <input type="checkbox" name="hobby" value="read books">책읽기</td>
      </tr>
      <tr >
          <td colspan="4"><input type = "submit" value="저장"></td>
      </tr>
  </table>
</form>
</body>
</html>