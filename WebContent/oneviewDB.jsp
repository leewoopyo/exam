<%@page import="kopo.dto.ExamSIO"%>
<%@page import="kopo.service.ExamServiceImpl"%>
<%@page import="kopo.service.ExamService"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, java.net.*"%>
<%@ page import="kopo.dao.*,kopo.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	<!-- jstl 사용을 위한 임포트  -->

<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h3>조회</h3>
<hr>
<%
//AllviewDB에서 넘겨준 파라메터 값을 받고 studentid 변수에 담는다 .
int studentid = Integer.parseInt(request.getParameter("studentid"));
try{
	//ExamServiceImpl객체 생성한다. 해당 객체는 ExamService형으로 담음
	ExamService examService = new ExamServiceImpl();
	//위 객체에서 정의된 selectOne메소드에 의해서 매개변수로 넣는 학번을 조건으로 데이터를 조회해서
	//메소드의 return형에서 정의한 대로 ExamSIO형의 변수에 집어 넣는다.(getter메소드로 꺼낼 수 있다.)
	ExamSIO exam = examService.selectOne(studentid);
%>
<!-- 테이블 생성  -->
	<table cellspacing=1 width=600 border=1>
	<tr>
		<td width=50><p align=center>이름</p></td>
		<td width=50><p align=center>학번</p></td>
		<td width=50><p align=center>국어</p></td>
		<td width=50><p align=center>영어</p></td>
		<td width=50><p align=center>수학</p></td>
	</tr>	
<!-- examSIO에 있는 getter메소드를 통해서 exam변수에 저장된 값을 가져온다. -->
	<tr>
		<td width=50><p align=center><%=exam.getName() %></p></td>
		<td width=50><p align=center><%=exam.getStudentid() %></p></td>
		<td width=50><p align=center><%=exam.getKor() %></p></td>
		<td width=50><p align=center><%=exam.getEng() %></p></td>
		<td width=50><p align=center><%=exam.getMat() %></p></td>
	</tr>	
	</table>
<%	
//예외처리
}catch(Exception e){
	out.print("oneview중 에러발생" + e);
}
%>
</body>
</html>