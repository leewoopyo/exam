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
<h3>조회</h3>
<hr>
<%
//studentid 파라메터 값 가져와서 변수에 담음
int studentid = Integer.parseInt(request.getParameter("studentid"));
try {
	//커넥터 드라이버 읽기
	//커넥터 버전에 따라 아래 문구가 약간의 차이가 있다. 
	Class.forName("com.mysql.cj.jdbc.Driver");
	//커넥션 객체 생성
	//내 DB서버의 아이피와 사용 DB를 적고, 사용하는 Mysql 계정과 비밀번호를 적는다.
	//														      아이피			DB		아이디	   비밀번호 
	Connection conn= DriverManager.getConnection("jdbc:mysql://192.168.56.1/kopo", "kopo15", "Qwer1234!!");
	//preparedstatement 객체에 sql문을 담음
    PreparedStatement ps=conn.prepareStatement("select * from examtable where studentid=?");
	//studentid변수를 sql문에 설정
    ps.setInt(1,studentid);
	//resultset에 결과 저장
    ResultSet rset=ps.executeQuery();  
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
	//rset에 담겼던 결과를 getter메소드 사용해서 한줄씩 출력 
    while (rset.next()) { 
            out.println("<tr>");
            out.println("<td width=50><p align=center>"+rset.getString(1)+"</p></td>");
            out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(2))+"</p></td>");
            out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3))+"</p></td>");
            out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4))+"</p></td>");
            out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5))+"</p></td>");
            out.println("<tr>");
    } 
	//연결 닫기
	rset.close(); 
	ps.close();
	conn.close();
//예외처리
} catch(Exception e) {
        out.println("데이터 조회 중 에러발생."+e);
}
%>
</body>
</html>
