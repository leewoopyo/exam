<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, java.net.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><center>JSP Database 실습 1</center></h1>
<hr>

<%

String data;
int cnt = 0;
FileReader f1 = null;
StringBuffer sb = null;

	try{
		f1 = new FileReader("C://test//cnt.txt");
		sb = new StringBuffer();
	}catch(Exception e){
		e.printStackTrace();
	}
		int ch = 0;
		
 		while((ch = f1.read()) != -1){
			sb.append((char)ch);
		}
		
		data = sb.toString().trim().replace("\n","");
		f1.close();	 
		
 		cnt=Integer.parseInt(data);
		cnt++;
		data=Integer.toString(cnt);
		FileWriter f2 = new FileWriter("C://test//cnt.txt",false);
		f2.write(data); 
		f2.close(); 
		

	
%>

<br><br>
<h3>현제 홈페이지 방문 조회수는 [ <%=data%> ]입니다.</h3>

</body>
</html>