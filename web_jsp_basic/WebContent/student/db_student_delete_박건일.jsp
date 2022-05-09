<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*, dao.*" %>
<%
request.setCharacterEncoding("utf-8");
Student_dao_박건일 dao = new Student_dao_박건일();
String sYear = request.getParameter("t_sYear");
String sClass = request.getParameter("t_sClass");
String no = request.getParameter("t_no");

int result = dao.getDeleteStudent(sYear,sClass,no);

String msg = "";
if(result == 1){
	msg = "삭제 완료";
}else{
	msg = "삭제실패";
}

%>
<script>
alert("<%=msg%>");
location.href="student_list_박건일.jsp";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>