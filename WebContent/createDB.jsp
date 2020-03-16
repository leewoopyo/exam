<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<%@ page import="kopo.dao.*,kopo.domain.*" %>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h3>테이블 생성</h3>

<%
try{
	//ExamRepo클래스의 createDB메소드를 실행한다 .(실행하면 테이블 생성)
	ExamRepo.createDB();
}catch(Exception e){
	out.print("테이블 생성 중 에러 발생" + e);
}
%>

</body>
</html>