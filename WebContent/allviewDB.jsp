<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>전체 데이터 조회</h3>
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
	//쿼리의 결과를 resultset에 담음
	ResultSet rset = stmt.executeQuery("select * from examtable;");
%>
	<!-- 테이블 생성 -->
	<table cellspacing=1 width=600 border=1>
		<tr>
			<td width=50><p align=center>이름</p></td>
			<td width=50><p align=center>학번</p></td>
			<td width=50><p align=center>국어</p></td>
			<td width=50><p align=center>영어</p></td>
			<td width=50><p align=center>수학</p></td>
		</tr>
<%   
	//반복문을 통해 resultset의 내용을  한줄씩 출력
	//out.print()에 태그와 내용을 적으면 해당 내용이 출력됨
    while (rset.next()) { 
            out.println("<tr>");
            out.println("<td width=50><p align=center>"+
	           			"<a href='oneviewDB.jsp?studentid="+Integer.toString(rset.getInt(2))+"'>"+
	            		rset.getString(1)+"</a></p></td>");
            out.println("<td width=50><p align=center>"+
		       			"<a href='oneviewDB.jsp?studentid="+Integer.toString(rset.getInt(2))+"'>"+
		         		Integer.toString(rset.getInt(2))+"</a></p></td>");
            out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3))+"</p></td>");
            out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4))+"</p></td>");
            out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5))+"</p></td>");
            out.println("<tr>");
    } 
	//연결 닫기
	rset.close(); 
	stmt.close();
	conn.close();
//예외 처리 
} catch(Exception e) {
        out.println("데이터 전체 조회 중 에러발생."+e);
}
%>
</body>
</html>
