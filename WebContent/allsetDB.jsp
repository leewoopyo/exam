<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<%@ page import="kopo.dao.*,kopo.domain.*" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h3>테이블 값 넣기</h3>
<%
//ExamRIO클래스와 ExamRepo클래스를 사용하려면 해당 클래스를 임포트 해야한다.
//ExamRepo클래스에 있는 insert메소드를 불러온다 매개변수로 ExamRIO형의 데이터를 넣고 
//ExamRIO클래스 에서 선언한 생성자에 맞게 객체를 선언한다.
try{
	ExamRepo.insert(new ExamRIO("나연",209901,95,100,95));
	ExamRepo.insert(new ExamRIO("정연",209902,90,90,100));
	ExamRepo.insert(new ExamRIO("모모",209903,85,80,95));
	ExamRepo.insert(new ExamRIO("사나",209904,75,100,85));
	ExamRepo.insert(new ExamRIO("지영",209905,85,70,75));
	ExamRepo.insert(new ExamRIO("미나",209906,95,80,95));
	ExamRepo.insert(new ExamRIO("다현",209907,85,100,85));
	ExamRepo.insert(new ExamRIO("채영",209908,75,90,65));
	ExamRepo.insert(new ExamRIO("쯔위",209909,85,80,95));
}catch(Exception e){
	out.print("테이블 생성 중 에러 발생" + e);
}

%>


</body>
</html>