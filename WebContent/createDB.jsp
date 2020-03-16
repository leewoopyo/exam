<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>테이블 생성</h3>
<hr>
<%
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
	//쿼리문 실행
	stmt.executeUpdate(
	"create table examtable(name varchar(20), studentid int not null primary key, kor int, eng int, mat int) DEFAULT CHARSET=utf8;");
	//연결 닫기
	stmt.close();
	conn.close();
	
	out.print("테이블 생성 완료");
//예외처리
} catch(Exception e) {
	out.println("테이블 생성중 에러발생."+e);
}
%>
</body>
</html>
