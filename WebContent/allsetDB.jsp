<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<%@ page import="kopo.dao.*,kopo.domain.*,kopo.dto.*,kopo.service.*" %>
<html>
<head>
<title>데이터 insert</title>
</head>
<body>
<h3>데이터 insert</h3>
<hr>
<%
	//ExamServiceImpl객체 생성한다. 해당 객체는 ExamService형으로 담음
	ExamService examService = new ExamServiceImpl(); 
	//해당 객체에 있는 allsetDB메소드를 실행한다.(데이터 삽입)
	examService.allsetDB();
%>


</body>
</html>