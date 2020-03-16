<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 Insert</title>
</head>
<body>
<h3>데이터 Insert</h3>
<hr>
<%
//데이터를 삽입하는 부분
try {
	//커넥터 드라이버 읽기
	//커넥터 버전에 따라 아래 문구가 약간의 차이가 있다. 
	Class.forName("com.mysql.cj.jdbc.Driver");
	//커넥션 객체 생성
	//내 DB서버의 아이피와 사용 DB를 적고, 사용하는 Mysql 계정과 비밀번호를 적는다.
	//														      아이피			DB		아이디	   비밀번호 
	Connection conn= DriverManager.getConnection("jdbc:mysql://192.168.56.1/kopo", "kopo15", "Qwer1234!!");
	//statement 객체 생성
	Statement stmt = conn.createStatement();
	//데이터 insert
	 stmt.executeUpdate("insert into examtable (name, studentid, kor, eng, mat) values('학생1',209901,95,100,95);"); 
    stmt.executeUpdate("insert into examtable (name, studentid, kor, eng, mat) values('학생2',209902,95,95,95);");
    stmt.executeUpdate("insert into examtable (name, studentid, kor, eng, mat) values('학생3',209903,100,100,100);");
    stmt.executeUpdate("insert into examtable (name, studentid, kor, eng, mat) values('학생4',209904,100,95,90);");
    stmt.executeUpdate("insert into examtable (name, studentid, kor, eng, mat) values('학생5',209905,80,100,70);");
    stmt.executeUpdate("insert into examtable (name, studentid, kor, eng, mat) values('학생6',209906,100,100,70);");
    stmt.executeUpdate("insert into examtable (name, studentid, kor, eng, mat) values('학생7',209907,70,70,70);");
    stmt.executeUpdate("insert into examtable (name, studentid, kor, eng, mat) values('학생8',209908,100,90,80);");
    stmt.executeUpdate("insert into examtable (name, studentid, kor, eng, mat) values('학생9',209909,80,100,90);");
    //연결 닫기
    stmt.close();
	conn.close();
	
	out.print("데이터 삽입 완료");
//예외 처리
} catch(Exception e) {
        out.println("데이터 삽입 중 에러발생."+e);
}
%>

</body>
</html>
