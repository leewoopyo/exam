<%@page import="kopo.service.ExamServiceImpl"%>
<%@page import="kopo.service.ExamService"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<%@ page import="kopo.dao.*,kopo.domain.*" %>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h3>테이블 삭제</h3>

<%
//ExamServiceImpl객체 생성한다. 해당 객체는 ExamService형으로 담음
ExamService examService = new ExamServiceImpl();
//테이블 생성 메소드를 불러옴
examService.dropDB();
%>

</body>
</html>