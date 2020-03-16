<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, java.net.*"%>
<%@ page import="kopo.dao.*,kopo.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	<!-- jstl 사용을 위한 임포트  -->
<html>
<head>
<title>Insert title here</title>
</head>
<body>


<h3>전체 데이터</h3>
<hr>
<%
try{
	//ExamRIO형이 담기는 list선언하고, 전체 데이터 를 가져오는 메소드를 실행한다. 
	List<ExamRIO> exams = ExamRepo.getAllrecords();
%>
<!-- 테이블 작성 -->
<table cellspacing=1 width=600 border=1>
	<tr>
		<td width=50><p align=center>이름</p></td>
		<td width=50><p align=center>학번</p></td>
		<td width=50><p align=center>국어</p></td>
		<td width=50><p align=center>영어</p></td>
		<td width=50><p align=center>수학</p></td>		
	</tr>

<%
//실제 list에 담기 내용이 나오는 부분이다. 반복문은 통해 ExamRIO형으로 한줄씩 출력한다.
//size로 전체 데이터 갯수만큼 반복하고, getter메소드를 이용해서 ExamRIO형에 담긴 데이터를 불러온다.
//tr과 td를 반복문 안에 넣어서 해당 테이블 요소도 반복될 수 있게 한다. 
	for(int i=0; i<exams.size();i++){%>
		<tr>
			<td width=50><p align=center>
			<a href="oneviewDB.jsp?studentid=<%=Integer.toString(exams.get(i).getStudentid()) %>">
			<%=exams.get(i).getName() %></a></p></td>
			<td width=50><p align=center>
			<a href="oneviewDB.jsp?studentid=<%=Integer.toString(exams.get(i).getStudentid()) %>">
			<%=Integer.toString(exams.get(i).getStudentid())%></a></p></td>
			<td width=50><p align=center><%=Integer.toString(exams.get(i).getKor())%></p></td>
			<td width=50><p align=center><%=Integer.toString(exams.get(i).getEng())%></p></td>
			<td width=50><p align=center><%=Integer.toString(exams.get(i).getMat())%></p></td>
		</tr>
	<%}
}catch(Exception e){ 
	out.print("테이블 생성 에러 발생" + e);
} 
%>
</table>
</body>
</html>